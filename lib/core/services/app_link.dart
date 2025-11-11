class AppLink{
  // doctor api
  static const String apiMyDoctorBaseUrl = "https://nypnasqvpmjznqrbwhzl.supabase.co/rest/v1";
  static const String getAllMyDoctors = "/mydoctor";


  static const String allDoctorsFaivorite = "$apiMyDoctorBaseUrl/favourite";
  static const String addFavouriteDoctor = "$apiMyDoctorBaseUrl/favourite";
  static const String deleteDoctorsFromFaivorite = "$apiMyDoctorBaseUrl/favourite?name=eq.";




  // VCare Live api
  static const String apiVCareLiveBaseUrl = "https://vcare.integration25.com/api";
  static const String userProfie = "/user/profile";
  static const String updateProfile = "/user/update";
  static const String getAllSpecialization ="/specialization/index";
  static const String getSpecializationById ="/specialization/show/";
  static const String getAllDoctor = "/doctor/index";

  static const String apiLogin="https://vcare.integration25.com/api/auth/login";
  static const String apiCreateAcount="https://vcare.integration25.com/api/auth/register";
  static const String apiLogout="https://vcare.integration25.com/api/auth/logout";

}