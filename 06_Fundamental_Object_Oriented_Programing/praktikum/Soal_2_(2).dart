class Course {
  String judul;
  String deskripsi;

  Course({required this.judul, required this.deskripsi});
}

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

void main() {
  // Buat objek Course
  Course course1 = Course(judul: "PHP", deskripsi: "Belajar PHP");
  Course course2 = Course(judul: "JavaScript", deskripsi: "Belajar JavaScript");

  // Buat objek Student
  Student student =
      Student(nama: "Rizal", kelas: "Informatika", courses: [course1, course2]);

  // Tambahkan course
  student.addCourse(Course(judul: "Flutter", deskripsi: "Belajar Flutter"));

  // Hapus course
  student.removeCourse(course1);

  // Tampilkan course yang diambil oleh student
  for (Course course in student.courses) {
    print("Course: ${course.judul}");
  }
}
