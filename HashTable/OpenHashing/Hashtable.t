/* Inits */
template <typename Key>
Hashtable<Key>::Hash_node::Hash_node(const Key &k, Hash_node *next) : _k(k), _next(next) { }

template <typename Key>
Hashtable<Key>::Hashtable() : _count(0) {
    _table_size = 20;
    _table = new Hash_node*[_table_size];
    for (int i = 0; i < _table_size; i++) {
      _table[i] = NULL;
    }
}
/* End Inits */

/* Deinits */
template <typename Key>
Hashtable<Key>::~Hashtable() {

}
/* End Deinits */

/* Consultors */
template <typename Key>
bool Hashtable<Key>::contains(const Key &k) const {
  int hash_v = _hash(k);

  Hash_node *node = _table[hash_v];
  bool repeated = false;
  while(node != NULL && !repeated) {
    repeated = node->_k == k;
    node = node->_next;
  }

  return repeated;
}

template <typename Key>
int Hashtable<Key>::count() const {
  return _count;
}

template <typename Key>
void Hashtable<Key>::print_hash(std::ostream &os) const {
  for(int i = 0; i < _table_size; i++) {
    Hash_node *node = _table[i];
    os<<"- ";
    while(node != NULL) {
      os<<node->_k<<" ";
      node = node->_next;
    }
    os<<"\n";
  }
}
/* End Consultors */

/* Modifiers */
template <typename Key>
void Hashtable<Key>::insert(const Key &k) {
  if(!contains(k)) {
    int hash_v = _hash(k);
    _table[hash_v] = new Hash_node(k, _table[hash_v]);
    _count++;
  }
}

template <typename Key>
void Hashtable<Key>::remove(const Key &k) {
  int hash_v = _hash(k);

  Hash_node *node = _table[hash_v], *last = NULL;
  bool finded = false;
  while(node != NULL && !finded) {
    finded = node->_k == k;
    if(!finded) node = node->_next;
  }

  if(finded) {
    if(last == NULL) {
      _table[hash_v] = node->_next;
    } else {
      last->_next = node->_next;
    }

    delete(node);
    node = NULL;
    _count--;
  }


}
/* End modifiers */

/* Private api */
template <typename Key>
int Hashtable<Key>::_hash(const Key &k) const {
  return reinterpret_cast<int>(k) % _table_size;
}
/* End private api */
