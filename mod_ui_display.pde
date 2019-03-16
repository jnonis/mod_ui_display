import g4p_controls.*;
import java.util.*;

color bgColor = color(200);

void setup() {
  size(320, 480);
  createGUI();
  onLoadPedalboard();
}

void draw() {
  background(bgColor);
}
 //<>//
void onLoadPedalboard() {
  List<PluginState> plugins = getPlugins();
  PedalboardView view = new PedalboardView(this, 10, 10, 300, 400, 0, 9, plugins);
  String[] names = new String[30];
  for (int i = 0; i < 30; i++) {
    names[i] = "Synte " + i;
  }
  view.setPedalboards(names);
}

void onCreateControlPage(PluginState plugin, int page) {
  println("Page: " + page);
  ControlsPagedView view = new ControlsPagedView(this, 10, 10, 300, 400, page, 9, plugin.controls);
  view.setTitle(plugin.name);
}

void onPanelClose(PanelPagedView panel) {
  println("Close");
  println(panel);
  if (panel instanceof ControlsPagedView) {
    onLoadPedalboard();
  }
  redraw();
}
