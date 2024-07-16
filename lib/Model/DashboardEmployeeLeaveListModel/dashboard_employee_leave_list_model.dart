
class Lvinfo {
  String? _leaveRegisterCode;
  String? _employeeCode;
  String? _employeeName;
  String? _employeeImage;
  int? _departmentId;
  String? _departmentName;
  int? _designationId;
  String? _designationName;
  String? _leaveType;
  String? _leaveReason;
  String? _leaveDate;
  int? _leaveDays;
  String? _mobileNumber;
  String? _applyDate;
  String? _fromDate;
  String? _toDate;
  String? _approvalStatus;

  Lvinfo(
      {String? leaveRegisterCode,
        String? employeeCode,
        String? employeeName,
        String? employeeImage,
        int? departmentId,
        String? departmentName,
        int? designationId,
        String? designationName,
        String? leaveType,
        String? leaveReason,
        String? leaveDate,
        int? leaveDays,
        String? mobileNumber,
        String? applyDate,
        String? fromDate,
        String? toDate,
        String? approvalStatus}) {
    if (leaveRegisterCode != null) {
      this._leaveRegisterCode = leaveRegisterCode;
    }
    if (employeeCode != null) {
      this._employeeCode = employeeCode;
    }
    if (employeeName != null) {
      this._employeeName = employeeName;
    }
    if (employeeImage != null) {
      this._employeeImage = employeeImage;
    }
    if (departmentId != null) {
      this._departmentId = departmentId;
    }
    if (departmentName != null) {
      this._departmentName = departmentName;
    }
    if (designationId != null) {
      this._designationId = designationId;
    }
    if (designationName != null) {
      this._designationName = designationName;
    }
    if (leaveType != null) {
      this._leaveType = leaveType;
    }
    if (leaveReason != null) {
      this._leaveReason = leaveReason;
    }
    if (leaveDate != null) {
      this._leaveDate = leaveDate;
    }
    if (leaveDays != null) {
      this._leaveDays = leaveDays;
    }
    if (mobileNumber != null) {
      this._mobileNumber = mobileNumber;
    }
    if (applyDate != null) {
      this._applyDate = applyDate;
    }
    if (fromDate != null) {
      this._fromDate = fromDate;
    }
    if (toDate != null) {
      this._toDate = toDate;
    }
    if (approvalStatus != null) {
      this._approvalStatus = approvalStatus;
    }
  }

  String? get leaveRegisterCode => _leaveRegisterCode;
  set leaveRegisterCode(String? leaveRegisterCode) =>
      _leaveRegisterCode = leaveRegisterCode;
  String? get employeeCode => _employeeCode;
  set employeeCode(String? employeeCode) => _employeeCode = employeeCode;
  String? get employeeName => _employeeName;
  set employeeName(String? employeeName) => _employeeName = employeeName;
  String? get employeeImage => _employeeImage;
  set employeeImage(String? employeeImage) => _employeeImage = employeeImage;
  int? get departmentId => _departmentId;
  set departmentId(int? departmentId) => _departmentId = departmentId;
  String? get departmentName => _departmentName;
  set departmentName(String? departmentName) =>
      _departmentName = departmentName;
  int? get designationId => _designationId;
  set designationId(int? designationId) => _designationId = designationId;
  String? get designationName => _designationName;
  set designationName(String? designationName) =>
      _designationName = designationName;
  String? get leaveType => _leaveType;
  set leaveType(String? leaveType) => _leaveType = leaveType;
  String? get leaveReason => _leaveReason;
  set leaveReason(String? leaveReason) => _leaveReason = leaveReason;
  String? get leaveDate => _leaveDate;
  set leaveDate(String? leaveDate) => _leaveDate = leaveDate;
  int? get leaveDays => _leaveDays;
  set leaveDays(int? leaveDays) => _leaveDays = leaveDays;
  String? get mobileNumber => _mobileNumber;
  set mobileNumber(String? mobileNumber) => _mobileNumber = mobileNumber;
  String? get applyDate => _applyDate;
  set applyDate(String? applyDate) => _applyDate = applyDate;
  String? get fromDate => _fromDate;
  set fromDate(String? fromDate) => _fromDate = fromDate;
  String? get toDate => _toDate;
  set toDate(String? toDate) => _toDate = toDate;
  String? get approvalStatus => _approvalStatus;
  set approvalStatus(String? approvalStatus) => _approvalStatus = approvalStatus;

  Lvinfo.fromJson(Map<String, dynamic> json) {
    _leaveRegisterCode = json['LeaveRegisterCode'];
    _employeeCode = json['EmployeeCode'];
    _employeeName = json['EmployeeName'];
    _employeeImage = json['EmployeeImage'];
    _departmentId = json['DepartmentId'];
    _departmentName = json['DepartmentName'];
    _designationId = json['DesignationId'];
    _designationName = json['DesignationName'];
    _leaveType = json['LeaveType'];
    _leaveReason = json['LeaveReason'];
    _leaveDate = json['LeaveDate'];
    _leaveDays = json['LeaveDays'];
    _mobileNumber = json['MobileNumber'];
    _applyDate = json['ApplyDate'];
    _fromDate = json['FromDate'];
    _toDate = json['ToDate'];
    _approvalStatus = json['ApprovalStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LeaveRegisterCode'] = this._leaveRegisterCode;
    data['EmployeeCode'] = this._employeeCode;
    data['EmployeeName'] = this._employeeName;
    data['EmployeeImage'] = this._employeeImage;
    data['DepartmentId'] = this._departmentId;
    data['DepartmentName'] = this._departmentName;
    data['DesignationId'] = this._designationId;
    data['DesignationName'] = this._designationName;
    data['LeaveType'] = this._leaveType;
    data['LeaveReason'] = this._leaveReason;
    data['LeaveDate'] = this._leaveDate;
    data['LeaveDays'] = this._leaveDays;
    data['MobileNumber'] = this._mobileNumber;
    data['ApplyDate'] = this._applyDate;
    data['FromDate'] = this._fromDate;
    data['ToDate'] = this._toDate;
    data['ApprovalStatus'] = this._approvalStatus;
    return data;
  }

}
