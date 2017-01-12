/* Inits */
template <typename T>
BST<T>::BST() : _root(NULL), _size(0) { }

template <typename T>
BST<T>::BST(const BST &tree) {

}

template <typename T>
BST<T>& BST<T>::operator=(const BST &tree) {

}

/* Deinits */
template <typename T>
BST<T>::~BST() {

}

/* Consultors */
template <typename T>
int BST<T>::size() const {
  return _size;
}

/* Modifiers */
template <typename T>
void BST<T>::insert(T data) {
  
}

/* Iterator */
/* - Iterator Inits - */
template <typename T>
BST<T>::iterator::iterator() : _root(NULL) { }

template <typename T>
BST<T>::iterator::iterator(const iterator &it) {
  _root = it._root;
}

template <typename T>
typename BST<T>::iterator& BST<T>::iterator::operator=(const iterator &it) {
  return *this;
}

/* - Iterator Deinits - */
template <typename T>
BST<T>::iterator::~iterator() {

}

/* - Iterator Consultors */
template <typename T>
T BST<T>::iterator::operator*() const {
  return NULL;
}

template <typename T>
typename BST<T>::iterator BST<T>::iterator::left() const {
  return iterator();
}

template <typename T>
typename BST<T>::iterator BST<T>::iterator::right() const {
  return iterator();
}

template <typename T>
BST<T>::iterator::operator bool() const{
  return false;
}

/* End Iterator */
