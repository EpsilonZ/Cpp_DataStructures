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

template <typename Key>
Hashtable<Key>::Hashtable(const Hashtable &h) : _table_size(h._table_size){
  try {
    _copy(h._table);
  } catch(...) {
    _delete();
    throw;
  }
}

template <typename Key>
Hashtable<Key>& Hashtable<Key>::operator=(const Hashtable &h) {
  unsigned int _aux_size = h._table_size;
  Hash_node **_aux_table = _table;
  
  try {
    _copy(h._table);
  } catch(...) {
    _delete();
    _table_size = _aux_size;
    _table = _aux_table;
    throw;
  }
  return *this;
}
/* End Inits */

/* Deinits */
template <typename Key>
Hashtable<Key>::~Hashtable() {
  _delete();
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

template <typename Key>
void Hashtable<Key>::_copy(Hash_node **p_table) {
  _table = new Hash_node*[_table_size];

  for (int i = 0; i < _table_size; i++) {
    if (p_table[i] != NULL) {
      Hash_node *node = p_table[i];
      while(node != NULL) {
        _table[i] = new Hash_node(node->_k, _table[i]);
        _count++;
        node = node->_next;
      }
    } else {
      _table[i] = NULL;
    }
  }
}

template <typename Key>
void Hashtable<Key>::_delete() {
  for (int i = _table_size-1; i >= 0; i--) {
    delete[] _table[i];
  }
}
/* End private api */
