import g4p_controls.*;

public class ControlsPagedView extends PanelPagedView {
  private GLabel label;
  private GButton close;
  
  public ControlsPagedView(PApplet p, int x, int y, int w, int h, int page, int pageSize, List<PluginControl> controls) {
    super(p, x, y, w, h, page, pageSize, controls);
  }
  
  public void onCreateHeader(PApplet p, int x, int y, int w, int h) {
    super.onCreateHeader(p, x, y, w, h);
    label = new GLabel(p, 45, 0, w - 85, 40);
    label.setText("Plugin Name");
    label.setTextBold();
    label.setOpaque(false);
    addHeaderControl(label);
    
    close = new GButton(p, 0, 0, 40, 40);
    close.setText("X");
    close.addEventHandler(this, "onClose");
    close.fireAllEvents(true);
    addHeaderControl(close);
  }
  
  public void setTitle(String title) {
    label.setText(title);
  }
  
  protected void addElementView(Object element, int x, int y) {
    PluginControl control = (PluginControl) element;
    if ("knob".equals(control.type)) {
      KnobControl controlView = new KnobControl(winApp, x, y);
      controlView.name.setText(control.name);
      controlView.knob.setLimits(control.min, control.max, control.value);
      controlView.value.setText(Float.toString(control.value));
      controlView.addToPanel(this);
    } else if ("toggle".equals(control.type)) {
      ToggleView controlView = new ToggleView(winApp, x, y);
      controlView.name.setText(control.name);
      controlView.addToPanel(this);
    } else if ("list".equals(control.type)) {
      ListView controlView = new ListView(winApp, x, y);
      controlView.name.setText(control.name);
      controlView.addToPanel(this);
    }
  }
  
  public void dispose() {
    super.dispose();
    label.dispose();
    close.dispose();
  }
  
  public void onClose(GButton button, GEvent event) {
    if (event != GEvent.CLICKED && event != GEvent.RELEASED) {
      return;
    }
    dispose();
    onPanelClose(this);
  }
}
