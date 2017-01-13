#include <iostream>
#include <iomanip>
#include "BST.hpp"
using namespace std;
void print_BST(BST<int>::iterator it, int indent) {
  if(it) {
    if(it.right()) print_BST(it.right(), indent+4);
    if(indent) cout<<setw(indent)<<' ';
    if (it.right()) std::cout<<" /\n" << std::setw(indent) << ' ';
    cout<<*it<<"\n"<<endl;
    if (it.left()) {
       std::cout << std::setw(indent) << ' ' <<" \\\n";
       print_BST(it.left(), indent+4);
    }
  }
}

using namespace std;
int main() {
  BST<int> bst;
  bst.insert(10);
  bst.insert(7);
  bst.insert(17);
  bst.insert(15);
  bst.insert(9);
  print_BST(bst.root(), 0);
  return 0;
}
