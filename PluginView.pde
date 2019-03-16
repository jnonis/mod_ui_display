import g4p_controls.*;

public class PluginView {
  private GButton button;
  private GPanel parent;
  private PluginState plugin;

  public PluginView(PApplet p, GPanel parent, int x, int y, PluginState plugin) {
    this.parent = parent;
    this.plugin = plugin;
    button = new GButton(p, x, y + 10, 80, 85);
    button.addEventHandler(this, "onClick");
    parent.addControl(button);
  }
  
  public void setName(String name) {
    button.setText(name);
  }
  
  public void onClick(GButton button, GEvent event) {
    parent.dispose();
    onCreateControlPage(plugin, 0);
  }
}
