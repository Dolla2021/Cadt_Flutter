void main() {
  var score = [45, 78, 60, 50, 32, 90, 33];
  var passScore = score.where((pass) => pass > 50);
  var result = passScore.length;
  print(passScore.toList());
  print("$result students passed.");
}
