/* Inits */
template <typename T>
BST<T>::BST() : _root(NULL), _size(0) { }

template <typename T>
BST<T>::BST(const BST &tree) {

}

template <typename T>
BST<T>& BST<T>::operator=(const BST &tree) {

}
/* End Inits */

/* Deinits */
template <typename T>
BST<T>::~BST() {

}

/* End Deinits */

/* Consultors */
template <typename T>
int BST<T>::size() const {
  return _size;
}

template <typename T>
typename BST<T>::iterator BST<T>::root() const {
  iterator it;
  it._root = _root;
  return it;
}

/* Modifiers */
template <typename T>
void BST<T>::insert(T data) {
  _root = _insert(_root, data);
}
/* End Modifiers */

/* Private Api*/
template <typename T>
typename BST<T>::BST_Node* BST<T>::_insert(BST_Node *n, T data) {
  if (n == NULL) {
    BST_Node *nod = new BST_Node;
    nod->data = data;
    nod->left = nod->right = NULL;
    return nod;
  }

  if (data < n->data ) {
    n->left = _insert(n->left, data);
  } else {
    n->right = _insert(n->right, data);
  }

  return n;
}
/* End Private Api */

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
  return _root->data;
}

template <typename T>
typename BST<T>::iterator BST<T>::iterator::left() const {
  iterator it;
  it._root = _root->left;
  return it;
}

template <typename T>
typename BST<T>::iterator BST<T>::iterator::right() const {
  iterator it;
  it._root = _root->right;
  return it;
}

template <typename T>
BST<T>::iterator::operator bool() const{
  return _root != NULL;
}

/* End Iterator */
