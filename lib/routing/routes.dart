const String aboutPageRoute = "/about";
const String newGameRoute = "/new_game";

String getRouteName(String route) {
  switch(route){
    case aboutPageRoute:
      return "About";
    case newGameRoute:
      return "Play";
    default:
      return route; 
  }
}