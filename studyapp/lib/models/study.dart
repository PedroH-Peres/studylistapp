class Study{

  int workTime;
  int breakTime;
  String title;
  String? description;
  int totalTimeofStudy = 0;

  Study({required this.workTime, required this.breakTime, required this.title, this.description});

  void incTotalTime(int i){
    totalTimeofStudy+=i;
  }

}