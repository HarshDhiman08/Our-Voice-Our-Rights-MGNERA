class MgnregaData {
  final String fin_year;
  final String month;
  final int state_code;
  final String state_name;
  final int district_code;
  final String district_name;
  final double Approved_Labour_Budget;
  final double Average_Wage_rate_per_day_per_person;
  final int Average_days_of_employment_provided_per_Household;
  final int Differently_abled_persons_worked;
  final double Material_and_skilled_Wages;
  final int Number_of_Completed_Works;
  final int Number_of_GPs_with_NIL_exp;
  final int Number_of_Ongoing_Works;
  final int Persondays_of_Central_Liability_so_far;
  final int SC_persondays;
  final int SC_workers_against_active_workers;
  final int ST_persondays;
  final int ST_workers_against_active_workers;
  final double Total_Adm_Expenditure;
  final double Total_Exp;
  final int Total_Households_Worked;
  final int Total_Individuals_Worked;
  final int Total_No_of_Active_Job_Cards;
  final int Total_No_of_Active_Workers;
  final int Total_No_of_HHs_completed_100_Days_of_Wage_Employment;
  final int Total_No_of_JobCards_issued;
  final int Total_No_of_Workers;
  final int Total_No_of_Works_Takenup;
  final double Wages;
  final int Women_Persondays;
  final double percent_of_Category_B_Works;
  final double percent_of_Expenditure_on_Agriculture_Allied_Works;
  final double percent_of_NRM_Expenditure;
  final double percentage_payments_gererated_within_15_days;
  final String? Remarks;

  MgnregaData({
    required this.fin_year,
    required this.month,
    required this.state_code,
    required this.state_name,
    required this.district_code,
    required this.district_name,
    required this.Approved_Labour_Budget,
    required this.Average_Wage_rate_per_day_per_person,
    required this.Average_days_of_employment_provided_per_Household,
    required this.Differently_abled_persons_worked,
    required this.Material_and_skilled_Wages,
    required this.Number_of_Completed_Works,
    required this.Number_of_GPs_with_NIL_exp,
    required this.Number_of_Ongoing_Works,
    required this.Persondays_of_Central_Liability_so_far,
    required this.SC_persondays,
    required this.SC_workers_against_active_workers,
    required this.ST_persondays,
    required this.ST_workers_against_active_workers,
    required this.Total_Adm_Expenditure,
    required this.Total_Exp,
    required this.Total_Households_Worked,
    required this.Total_Individuals_Worked,
    required this.Total_No_of_Active_Job_Cards,
    required this.Total_No_of_Active_Workers,
    required this.Total_No_of_HHs_completed_100_Days_of_Wage_Employment,
    required this.Total_No_of_JobCards_issued,
    required this.Total_No_of_Workers,
    required this.Total_No_of_Works_Takenup,
    required this.Wages,
    required this.Women_Persondays,
    required this.percent_of_Category_B_Works,
    required this.percent_of_Expenditure_on_Agriculture_Allied_Works,
    required this.percent_of_NRM_Expenditure,
    required this.percentage_payments_gererated_within_15_days,
    this.Remarks,
  });

  double get personDaysGenerated =>
      Persondays_of_Central_Liability_so_far.toDouble();

  double get womenParticipationRate {
    if (Total_Individuals_Worked == 0) return 0.0;
    return (Women_Persondays / Total_Individuals_Worked) * 100.0;
  }

  static int _parseInt(dynamic v) {
    if (v == null) return 0;
    if (v is int) return v;
    if (v is double) return v.toInt();
    return int.tryParse(v.toString().replaceAll(',', '').trim()) ?? 0;
  }

  static double _parseDouble(dynamic v) {
    if (v == null) return 0.0;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    return double.tryParse(v.toString().replaceAll(',', '').trim()) ?? 0.0;
  }

  static String _parseString(dynamic v) {
    if (v == null) return '';
    return v.toString().trim();
  }

  factory MgnregaData.fromJson(Map<String, dynamic> json) {
    return MgnregaData(
      fin_year: _parseString(json["fin_year"]),
      month: _parseString(json["month"]),
      state_code: _parseInt(json["state_code"]),
      state_name: _parseString(json["state_name"]),
      district_code: _parseInt(json["district_code"]),
      district_name: _parseString(json["district_name"]),
      Approved_Labour_Budget: _parseDouble(json["Approved_Labour_Budget"]),
      Average_Wage_rate_per_day_per_person:
      _parseDouble(json["Average_Wage_rate_per_day_per_person"]),
      Average_days_of_employment_provided_per_Household:
      _parseInt(json["Average_days_of_employment_provided_per_Household"]),
      Differently_abled_persons_worked:
      _parseInt(json["Differently_abled_persons_worked"]),
      Material_and_skilled_Wages:
      _parseDouble(json["Material_and_skilled_Wages"]),
      Number_of_Completed_Works: _parseInt(json["Number_of_Completed_Works"]),
      Number_of_GPs_with_NIL_exp: _parseInt(json["Number_of_GPs_with_NIL_exp"]),
      Number_of_Ongoing_Works: _parseInt(json["Number_of_Ongoing_Works"]),
      Persondays_of_Central_Liability_so_far:
      _parseInt(json["Persondays_of_Central_Liability_so_far"]),
      SC_persondays: _parseInt(json["SC_persondays"]),
      SC_workers_against_active_workers:
      _parseInt(json["SC_workers_against_active_workers"]),
      ST_persondays: _parseInt(json["ST_persondays"]),
      ST_workers_against_active_workers:
      _parseInt(json["ST_workers_against_active_workers"]),
      Total_Adm_Expenditure: _parseDouble(json["Total_Adm_Expenditure"]),
      Total_Exp: _parseDouble(json["Total_Exp"]),
      Total_Households_Worked: _parseInt(json["Total_Households_Worked"]),
      Total_Individuals_Worked: _parseInt(json["Total_Individuals_Worked"]),
      Total_No_of_Active_Job_Cards:
      _parseInt(json["Total_No_of_Active_Job_Cards"]),
      Total_No_of_Active_Workers: _parseInt(json["Total_No_of_Active_Workers"]),
      Total_No_of_HHs_completed_100_Days_of_Wage_Employment: _parseInt(
          json["Total_No_of_HHs_completed_100_Days_of_Wage_Employment"]),
      Total_No_of_JobCards_issued: _parseInt(json["Total_No_of_JobCards_issued"]),
      Total_No_of_Workers: _parseInt(json["Total_No_of_Workers"]),
      Total_No_of_Works_Takenup: _parseInt(json["Total_No_of_Works_Takenup"]),
      Wages: _parseDouble(json["Wages"]),
      Women_Persondays: _parseInt(json["Women_Persondays"]),
      percent_of_Category_B_Works:
      _parseDouble(json["percent_of_Category_B_Works"]),
      percent_of_Expenditure_on_Agriculture_Allied_Works: _parseDouble(
          json["percent_of_Expenditure_on_Agriculture_Allied_Works"]),
      percent_of_NRM_Expenditure:
      _parseDouble(json["percent_of_NRM_Expenditure"]),
      percentage_payments_gererated_within_15_days:
      _parseDouble(json["percentage_payments_gererated_within_15_days"]),
      Remarks: json["Remarks"]?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    "fin_year": fin_year,
    "month": month,
    "state_code": state_code,
    "state_name": state_name,
    "district_code": district_code,
    "district_name": district_name,
    "Approved_Labour_Budget": Approved_Labour_Budget,
    "Average_Wage_rate_per_day_per_person":
    Average_Wage_rate_per_day_per_person,
    "Average_days_of_employment_provided_per_Household":
    Average_days_of_employment_provided_per_Household,
    "Differently_abled_persons_worked": Differently_abled_persons_worked,
    "Material_and_skilled_Wages": Material_and_skilled_Wages,
    "Number_of_Completed_Works": Number_of_Completed_Works,
    "Number_of_GPs_with_NIL_exp": Number_of_GPs_with_NIL_exp,
    "Number_of_Ongoing_Works": Number_of_Ongoing_Works,
    "Persondays_of_Central_Liability_so_far":
    Persondays_of_Central_Liability_so_far,
    "SC_persondays": SC_persondays,
    "SC_workers_against_active_workers":
    SC_workers_against_active_workers,
    "ST_persondays": ST_persondays,
    "ST_workers_against_active_workers":
    ST_workers_against_active_workers,
    "Total_Adm_Expenditure": Total_Adm_Expenditure,
    "Total_Exp": Total_Exp,
    "Total_Households_Worked": Total_Households_Worked,
    "Total_Individuals_Worked": Total_Individuals_Worked,
    "Total_No_of_Active_Job_Cards": Total_No_of_Active_Job_Cards,
    "Total_No_of_Active_Workers": Total_No_of_Active_Workers,
    "Total_No_of_HHs_completed_100_Days_of_Wage_Employment":
    Total_No_of_HHs_completed_100_Days_of_Wage_Employment,
    "Total_No_of_JobCards_issued": Total_No_of_JobCards_issued,
    "Total_No_of_Workers": Total_No_of_Workers,
    "Total_No_of_Works_Takenup": Total_No_of_Works_Takenup,
    "Wages": Wages,
    "Women_Persondays": Women_Persondays,
    "percent_of_Category_B_Works": percent_of_Category_B_Works,
    "percent_of_Expenditure_on_Agriculture_Allied_Works":
    percent_of_Expenditure_on_Agriculture_Allied_Works,
    "percent_of_NRM_Expenditure": percent_of_NRM_Expenditure,
    "percentage_payments_gererated_within_15_days":
    percentage_payments_gererated_within_15_days,
    "Remarks": Remarks,
  };
}
