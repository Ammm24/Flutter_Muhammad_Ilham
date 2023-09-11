class Student {
  String nama;
  String kelas;
  List<Course> courses;

  Student({required this.nama, required this.kelas, required this.courses});

  void addCourse(Course course) {
    courses.add(course);
  }

  void removeCourse(Course course) {
    courses.remove(course);
  }

  List<Course> getCourses() {
    return courses;
  }
}

class Course {}
