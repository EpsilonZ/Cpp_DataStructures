#include <iostream>
#include "Hashtable.hpp"
using namespace std;

int main() {
  Hashtable<int> hashtable;
  hashtable.insert(14);
  hashtable.insert(34);
  // hashtable.print_hash(cout);
  // cout<<endl;
  hashtable.remove(35);
  hashtable.remove(34);
  hashtable.print_hash(cout);
  //
  // cout<<hashtable.contains(34)<<endl;
  // cout<<hashtable.contains(14)<<endl;

  Hashtable<int> hashtable_c(hashtable);
  cout<<endl;
  hashtable_c.insert(18);
  hashtable_c.print_hash(cout);

  Hashtable<int> hashtable_o(hashtable_c);
  hashtable_o.insert(5);
  hashtable_o.remove(18);
  cout<<endl;
  hashtable_o.print_hash(cout);
  return  0;
}
