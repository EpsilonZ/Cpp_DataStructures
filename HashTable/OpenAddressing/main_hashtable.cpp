#include <iostream>
#include "Hashtable.hpp"
using namespace std;


int main() {

  Hashtable<int> hashtable;
  hashtable.insert(10);
  hashtable.insert(5);
  hashtable.insert(18);
  cout<<hashtable.contains(18)<<endl;
  cout<<hashtable.contains(5)<<endl;
  cout<<hashtable.contains(7)<<endl;
  hashtable.print_hash(cout);
  return 0;
}
