class Course {
  String title;
  String description;
  Course(this.title, this.description);
}

class Student {
  String name;
  String className;
  List<Course> courses = [];
  Student(this.name, this.className);

  void addCourse(Course course) { // Method untuk menambahkan course ke dalam daftar course student
    courses.add(course);
    print("Kursus ${course.title} berhasil ditambahkan.");
  }
  void removeCourse(Course course) { // Method untuk menghapus course dari daftar course student
    courses.remove(course);
  }

  void viewCourses() { // Method untuk melihat semua course yang dimiliki oleh student
    if (courses.isEmpty) {
      print("Belum ada course yang ditambahkan.");
    } else {
      print("Daftar Kursus:");
      for (var course in courses) {
        print("- ${course.title}: ${course.description}");
      }
    }
  }
}

void main() {
  Course matematika = Course("Dart Programming", "Learn Dart programming language"); // Membuat objek Course
  
  Student udin = Student("John", "XII-A"); // Membuat objek Student

  udin.addCourse(matematika); // Menambahkan course ke dalam daftar course student
 
  udin.viewCourses();  // Menampilkan semua course yang dimiliki oleh student

  // Menghapus salah satu course dari daftar course student
  // udin.removeCourse(matematika);

}
