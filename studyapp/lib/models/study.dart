class Study{

  final int workTime;
  final int breakTime;
  final String title;
  final String? description;
  int totalTimeofStudy = 0;

  Study({required this.workTime, required this.breakTime, required this.title, this.description});

  void incTotalTime(int i){
    totalTimeofStudy+=i;
  }

}