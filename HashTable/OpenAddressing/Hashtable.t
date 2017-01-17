/* Inits */
template <typename Key>
Hashtable<Key>::Hashtable() : _count(0) {
    _table_size = 20;
    _table = new Hash_node[_table_size];

    for (int i = 0; i < _table_size; i++) {
      Hash_node hash = Hash_node();
      hash._est = lliure;
      _table[i] = hash;
    }
}

template <typename Key>
Hashtable<Key>::Hashtable(const Hashtable &h) : _table_size(h._table_size){

}

template <typename Key>
Hashtable<Key>& Hashtable<Key>::operator=(const Hashtable &h) {
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
  int i = _find(k);
  return _table[i]._est == ocupat && _table[i]._k == k;
}

template <typename Key>
int Hashtable<Key>::_find(const Key &k) const {
  int i = _hash(k);
  int first_empty = -1;
  unsigned int cont = 0;

  while (_table[i]._k != k &&_table[i]._est != lliure && cont < _table_size) {
    if (_table[i]._est == esborrat && first_empty == -1) {
      first_empty = i;
    }
    i = (i+1)%_table_size;
  }

  if(_table[i]._est == lliure and _table[i]._k != k) {
    if(first_empty != -1) {
      i = first_empty;
    }
  }

  return i;
}

template <typename Key>
int Hashtable<Key>::count() const {
  return _count;
}

template <typename Key>
void Hashtable<Key>::print_hash(std::ostream &os) const {
  for(int i = 0; i < _table_size; i++) {
    Hash_node *node = &_table[i];
    if (_table[i]._est == lliure) {
      os<<"-1";
    } else {
      os<<node->_k;
    }
    os<<"\n";
  }
}
/* End Consultors */

/* Modifiers */
template <typename Key>
void Hashtable<Key>::insert(const Key &k) {
  int i = _find(k);
  if(_table[i]._est == ocupat && _table[i]._k != k) {
    //Redispersió
  }

  if(_table[i]._est != ocupat) {
    _count++;
  }

  _table[i]._k = k;
  _table[i]._est = ocupat;
}

template <typename Key>
void Hashtable<Key>::remove(const Key &k) {
  int i = _find(k);

  if(_table[i]._est == ocupat && _table[i]._k == k) {
    _table[i]._est = esborrat;
  }
}
/* End modifiers */

/* Private api */
template <typename Key>
int Hashtable<Key>::_hash(const Key &k) const {
  return reinterpret_cast<int>(k) % _table_size;
}

template <typename Key>
void Hashtable<Key>::_copy(Hash_node *p_table) {

}

template <typename Key>
void Hashtable<Key>::_delete() {
  delete[] _table;
}
/* End private api */
