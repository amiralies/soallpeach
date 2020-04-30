#include <bitset>
#include <fstream>
#include <string>

using namespace std;

#define endl '\n'
#define MAX_N 100000

int main(int argc, char **argv) {
  ios::sync_with_stdio(false);

  bitset<MAX_N + 1> bs;
  bs.set();

  bs.set(0, false);
  bs.set(1, false);
  for (int i = 2; i * i <= MAX_N; i++) {

    if (bs.test(i)) {
      for (int j = i * 2; j <= MAX_N; j += i) {
        bs.set(j, false);
      }
    }
  }

  string line;
  ifstream input(argv[1]);

  int n;
  while (getline(input, line)) {
    n = stoi(line);
    if (n >= MAX_N) {
      putchar('1');
    } else {
      putchar(bs[n] ? '1' : '0');
    }
    putchar('\n');
  }

  input.close();

  return 0;
}
