import g4p_controls.*;

public class KnobControl {
  private int x;
  private int y;
  private GLabel name;
  private GKnob knob;
  private GLabel value;

  public KnobControl(PApplet p, int x, int y) {
    this.x = x;
    this.y = y;
    name = new GLabel(p, x, y, 80, 40);
    name.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    name.setText("");
    name.setOpaque(false);
    knob = new GKnob(p, x + 10, y + 40, 60, 60, 0.8);
    knob.setTurnRange(110, 70);
    knob.setTurnMode(GKnob.CTRL_VERTICAL);
    knob.setSensitivity(1);
    knob.setShowArcOnly(false);
    knob.setOverArcOnly(false);
    knob.setIncludeOverBezel(false);
    knob.setShowTrack(true);
    knob.setLimits(0.5, 0.0, 1.0);
    knob.setShowTicks(false);
    knob.setOpaque(false);
    knob.addEventHandler(this, "knobTurn");
    value = new GLabel(p, x, y + 100, 80, 20);
    value.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    value.setText("1.00");
    value.setOpaque(false);
  }
  
  public void dispose() {
    name.dispose();
    knob.dispose();
    value.dispose();
  }
  
  public void addToPanel(GPanel panel) {
    panel.addControl(name);
    panel.addControl(knob);
    panel.addControl(value);
  }
  
  void knobTurn(GKnob knob, GEvent event) {
    println("Control turn");
  }
}
