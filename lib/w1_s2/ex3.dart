void main() {
  var score = [45, 78, 60, 50, 32, 90, 33];
  var pass_score = score.where((pass) => pass > 50);
  var result = pass_score.length;
  print(pass_score.toList());
  print("$result students passed.");
}
