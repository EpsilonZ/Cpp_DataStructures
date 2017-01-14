#include <iostream>
#include <iomanip>
#include <limits.h>
#include "BST.hpp"
using namespace std;
#define MIN_INT 1<<32
#define MAX_INT (1<<31)-1

/* Print */
void print_BST(BST<int>::iterator it, int indent) {
  if(it) {
    if(it.right()) print_BST(it.right(), indent+6);
    if(indent) cout<<setw(indent)<<' ';
    if (it.right()) std::cout<<" /\n" << std::setw(indent) << ' ';
    cout<<*it<<"\n"<<endl;
    if (it.left()) {
       std::cout << std::setw(indent) << ' ' <<" \\\n";
       print_BST(it.left(), indent+6);
    }
  }
}
/* End Print */

/* Common tests */
void common_tests() {
  BST<int> bst;
  bst.insert(10);
  bst.insert(7);
  bst.insert(17);
  bst.insert(15);
  bst.insert(9);
  cout<<bst.size()<<endl;
  print_BST(bst.root(), 0);

  cout<<endl;
  BST<int> bst_c(bst);
  cout<<bst_c.size()<<endl;
  print_BST(bst_c.root(), 0);

  cout<<endl;
  BST<int> bst_o = bst_c;
  cout<<bst_o.size()<<endl;
  print_BST(bst_o.root(), 0);
}
/* End common tests*/

/* Exam exercicies */
/*
  @r_is_binary_tree
  @discussion : This method is correct and efficient, we use min and max to check
  if *it (node value) satisfy *it > min && *it < max, with this method, we can garatee
  that our tree is a binary tree.
  @web_page : http://www.geeksforgeeks.org/a-program-to-check-if-a-binary-tree-is-bst-or-not/
*/
bool r_is_binary_tree(BST<int>::iterator it, int min, int max) {
  if(!it) return true;

  bool binary = true;
  if(*it < min || *it > max) {
    binary = false;
  }

  return binary &&
         r_is_binary_tree(it.left(), min, (*it)-1) &&
         r_is_binary_tree(it.right(), (*it)+1, max);
}

/*
  @is_binary_tree
  @discussion : Of course, the final tree will be a binary
  because tree insert in the right order. left < root < rigth.
  But we will check anyway.
  @cost : O(n) when be binary.
*/
void is_binary_tree(){
  BST<int> bst;
  bst.insert(10);
  bst.insert(7);
  bst.insert(17);
  bst.insert(15);
  bst.insert(9);
  bst.insert(3);
  bst.insert(8);
  bst.insert(20);
  bst.insert(13);

  print_BST(bst.root(), 0);
  cout<<"Is binary : "<<r_is_binary_tree(bst.root(), INT_MIN, INT_MAX)<<endl;

}
/* End exam exercicies */

int main() {
  // common_tests();
  is_binary_tree();
  return 0;
}
