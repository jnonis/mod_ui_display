import g4p_controls.*;

public class PedalboardView extends PanelPagedView {
  private GDropList pedalboards;
  
  public PedalboardView(PApplet p, int x, int y, int w, int h, int page, int pageSize, List<PluginState> plugins) {
    super(p, x, y, w, h, page, pageSize, plugins);
  }
  
  public void onCreateHeader(PApplet p, int x, int y, int w, int h) {
    super.onCreateHeader(p, x, y, w, h);
    
    pedalboards = new GDropList(p, 0, 0, w - 80, 440, 10, 40);
    pedalboards.setItems(new String[] { "Test" }, 0);
    pedalboards.addEventHandler(this, "onPedalboardSelected");
    addHeaderControl(pedalboards);
  }
  
  public void setPedalboards(String[] names) {
    pedalboards.setItems(names, 0);
  }
  
  protected void addElementView(Object element, int x, int y) {
    PluginState plugin = (PluginState) element;
    PluginView view = new PluginView(winApp, this, x, y, plugin);
    view.setName(plugin.name);
  }
  
  public void dispose() {
    super.dispose();
    pedalboards.dispose();
  }
  
  public void onPedalboardSelected(GDropList dropList, GEvent event) {
  }
}
