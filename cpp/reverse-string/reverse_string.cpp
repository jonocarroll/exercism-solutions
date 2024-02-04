#include "reverse_string.h"

using namespace std;

namespace reverse_string
{
  string reverse_string(string s) {
    string res = "";
    if (s.length() == 0) {
      return res;
      };
    for (int i = s.length() - 1; i >= 0; i--) {
      res += s[i];
    }
    return res;
  }
}  // namespace reverse_string
