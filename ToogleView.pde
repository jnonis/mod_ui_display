import g4p_controls.*;

public class ToggleView {
  private GLabel name;
  private GImageToggleButton toggle;
  private GLabel value;
  
  public ToggleView(PApplet p, int x, int y) {
    name = new GLabel(p, x, y, 80, 40);
    name.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    name.setText("");
    name.setOpaque(false);
    toggle = new GImageToggleButton(p, x + 20, y + 40);
    toggle.setOpaque(false);
    toggle.addEventHandler(this, "onToggleChange");
    value = new GLabel(p, x, y + 100, 80, 20);
    value.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    value.setText("1.00");
    value.setOpaque(false);
  }
  
  public void dispose() {
    name.dispose();
    toggle.dispose();
    value.dispose();
  }
  
  public void addToPanel(GPanel panel) {
    panel.addControl(name);
    panel.addControl(toggle);
    panel.addControl(value);
  }
  
  public void onToggleChange(GImageToggleButton toggle, GEvent event) {
  }
}
