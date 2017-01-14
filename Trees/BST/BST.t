/* Inits */
template <typename T>
BST<T>::BST() : _root(NULL), _size(0) { }

template <typename T>
BST<T>::BST(const BST &tree) {
  _root = _copy(tree._root);
  _size = tree._size;
}

template <typename T>
BST<T>& BST<T>::operator=(const BST &tree) {
  BST_Node *aux = _root;
  try {
    _root = _copy(tree._root);
  } catch(...) {
    _root = aux;
    throw;
  }

  _size = tree._size;

  return *this;
}
/* End Inits */

/* Deinits */
template <typename T>
BST<T>::~BST() {
  _delete(_root);
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

template <typename T>
BST<T> BST<T>::operator+(const BST &tree) {
  BST<T> aux;
  aux._root = _sum_nodes(_root, tree._root);
  return aux;
}
/* End Modifiers */

/* Private Api*/
template <typename T>
typename BST<T>::BST_Node* BST<T>::_insert(BST_Node *n, T data) {
  if (n == NULL) {
    BST_Node *nod = new BST_Node;
    nod->data = data;
    nod->left = nod->right = NULL;
    _size++;
    return nod;
  }

  if (data < n->data ) {
    n->left = _insert(n->left, data);
  } else {
    n->right = _insert(n->right, data);
  }

  return n;
}

template <typename T>
void BST<T>::_delete(BST_Node *n) {
  if (n != NULL) {
    _delete(n->left);
    _delete(n->right);
    delete n;
    n = NULL;
  }
}

template <typename T>
typename BST<T>::BST_Node* BST<T>::_copy(BST_Node *n) {
  BST_Node *aux = NULL;
  if(n != NULL) {
    aux = new BST_Node;
    try {
      aux->data = n->data;
      aux->left = _copy(n->left);
      aux->right = _copy(n->right);
    } catch(...) {
      _delete(_root);
      throw;
    }
  }

  return aux;
}

template <typename T>
typename BST<T>::BST_Node* BST<T>::_sum_nodes(BST_Node *pi_node, BST_Node *p_node) {
  BST_Node *aux = NULL;
  if (pi_node != NULL && p_node != NULL) {
    aux = new BST_Node;
    aux->data = pi_node->data + p_node->data;
    aux->left = _sum_nodes(pi_node->left, p_node->left);
    aux->right = _sum_nodes(pi_node->right, p_node->right);
  } else if (p_node != NULL){
    aux = new BST_Node;
    aux->data = p_node->data;
    aux->left = _sum_nodes(pi_node, p_node->left);
    aux->right = _sum_nodes(pi_node, p_node->right);
  } else if (pi_node != NULL) {
    aux = new BST_Node;
    aux->data = pi_node->data;
    aux->left = _sum_nodes(pi_node->left, p_node);
    aux->right = _sum_nodes(pi_node->right, p_node);
  }

  return aux;
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
BST<T>::iterator::~iterator() {}

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
