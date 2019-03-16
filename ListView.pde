import g4p_controls.*;

public class ListView {
  private GLabel name;
  private GDropList list;
  
  public ListView(PApplet p, int x, int y) {
    name = new GLabel(p, x, y, 80, 40);
    name.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    name.setText("");
    name.setOpaque(false);
    list = new GDropList(p, x, y + 40, 80, 320, 8, 40);
    list.setItems(new String[] { "Test", "Test", "Test", "Test" }, 0);
    list.addEventHandler(this, "onItemSelected");
  }
  
  public void dispose() {
    name.dispose();
    list.dispose();
  }
  
  public void addToPanel(GPanel panel) {
    panel.addControl(name);
    panel.addControl(list);
  }
  
  public void onItemSelected(GDropList list, GEvent event) {
  }
}
