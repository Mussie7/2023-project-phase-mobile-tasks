class Task {
  // initializing the private fields
  late String _id;
  late String _title;
  String? _description, _dueDate;
  String _status = "Pending";

  // a method to add title
  void addTitle(String title) {
    this._title = title;
  }

  // a method to add the task description
  void addDescription(String? description) {
    this._description = description;
  }

  // a method to add the dueDate
  void addDueDate(String? date) {
    this._dueDate = date;
  }

  // a method to set the status of the task
  void setStatus(String status) {
    this._status = status;
  }

  // a method to access the status of the task
  String getStatus() {
    return this._status;
  }

  // a method to assign ID to the task
  void setId(id) {
    this._id = id;
  }

  // a method to display the task
  void displayTask() {
    print("Task ID: ${this._id}");
    print("Title: ${this._title}");
    print("Description: ${this._description}");
    print("Due Date: ${this._dueDate}");
    print("Status: ${this._status}");
  }
}
