#include <algorithm>
#include <chrono>
#include <iostream>
#include <random>
#include <vector>
#include <cstdint>

#include <cheerp/client.h>

struct Data {
  int a;
  int b;
  bool operator<(const Data& other) {
    if (a<other.a) return true;
    if (a>other.a) return false;
    return b < other.b;
  }
};

std::vector<Data> randomVec(int size, int max, uint32_t seed) {
  std::mt19937 rng;
  rng.seed(seed);
  std::uniform_int_distribution<int> dist{0, max};
  std::vector<Data> ret(size);
  std::generate(ret.begin(), ret.end(), [&rng, &dist] { return Data{dist(rng), dist(rng)}; });
  return ret;
}

[[cheerp::genericjs]]
void printVec(const std::vector<Data> &v, const std::string& divId, size_t n) {
  auto* pre = client::document.getElementById(divId.c_str());
  pre->set_innerText("");
  auto* s = new client::String();
  for (auto i : v) {
    if (n-- == 0)
      break;
    s = s->concat(i.a)->concat(",")->concat(i.b)->concat("\n");
  }
  pre->set_innerText(s);
}



[[clang::noinline]]
void bubbleSort(std::vector<Data>& v) {
  for (size_t i = 0; i < v.size(); i++) {
    for (size_t j = 0; j < i; j++) {
      if (v[i] < v[j]) {
        std::swap(v[i], v[j]);
      }
    }
  }
}

[[cheerp::jsexport]]
void run(int size, int max) {
  auto now = std::chrono::system_clock::now().time_since_epoch();
  int seed = 0;//now.count();
  auto v = randomVec(size, max, seed);
  printVec(v, "unsorted", 10);
  bubbleSort(v);
  printVec(v, "sorted", 10);
}
