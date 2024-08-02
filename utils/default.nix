rec {
  mkCmdMap = mode: key: action: desc: {
    inherit mode;
    inherit key;
    inherit action;
    options = { inherit desc; };
  };

  mkLuaMap = mode: key: lua: desc:
    mkCmdMap mode key
      {
        __raw = lua;
      }
      desc;

  mkCmdMapN = key: action: desc:
    mkCmdMap [ "n" ] key action desc;

  mkLuaMapN = key: action: desc:
    mkLuaMap [ "n" ] key action desc;
}
