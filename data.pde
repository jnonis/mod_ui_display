
List<PluginState> getPlugins() {
  List<PluginState> plugins = new ArrayList();
  
  PluginState plugin = new PluginState();
  plugin.id = "1";
  plugin.name = "Distortion";
  plugin.imageUrl = "TODO";
  plugin.controls = new ArrayList();
  for (int i = 0; i < 20; i++) {
    PluginControl control = new PluginControl();
    control.name = "Control " + i;
    if (i == 1) {
      control.type = "list";
    } else if (i % 2 == 0) {
      control.type = "toggle";
    } else {
      control.type = "knob";
    }
    control.value = i;
    control.max = 10 * (i + 1);
    control.min = 10 * -i;
    plugin.controls.add(control);
  }
  plugins.add(plugin);
  
  plugin = new PluginState();
  plugin.id = "2";
  plugin.name = "Chorus";
  plugin.imageUrl = "TODO";
  plugin.controls = new ArrayList();
  for (int i = 0; i < 5; i++) {
    PluginControl control = new PluginControl();
    control.name = "Control " + i;
    control.type = "knob";
    control.value = i;
    control.max = 10 * (i + 1);
    control.min = 10 * -i;
    plugin.controls.add(control);
  }
  plugins.add(plugin);
  
  return plugins;
}


class PluginState {
  String id;
  String name;
  String imageUrl;
  List<PluginControl> controls;
}

class PluginControl {
  String name;
  String type;
  float max;
  float min;
  float value;
}
