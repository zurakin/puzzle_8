const String mainMenuRoute = "/menu";
const String newGameRoute = "/new_game";

String getRouteName(String route) {
  switch(route){
    case mainMenuRoute:
      return "Main Menu";
    case newGameRoute:
      return "New Game";
    default:
      return route; 
  }
}