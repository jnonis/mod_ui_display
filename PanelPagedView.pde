import g4p_controls.*;

public class PanelPagedView extends GPanel {
  protected GView headerBackground;
  protected GButton next;
  protected GButton previous;
  protected List<GAbstractControl> views = new ArrayList();
  protected int page;
  protected int pageSize;
  protected List elements = new ArrayList();
  
  public PanelPagedView(PApplet p, int x, int y, int w, int h, int page, int pageSize, List elements) {
    super(p, x, y, w, h);
    this.page = page;
    this.pageSize = pageSize;
    if (elements != null) {
      this.elements = elements;
    }
    setCollapsed(false);
    setCollapsible(false);
    setDraggable(false);
    setText("");
    setOpaque(true);
    
    onCreateHeader(p, x, y, w, h);
    onCreatePage();
  }
  
  public void onCreateHeader(PApplet p, int x, int y, int w, int h) {
    headerBackground = new GView(p, 0, 0, w, 40, JAVA2D);
    PGraphics g = headerBackground.getGraphics();
    g.beginDraw();
    g.background(200);
    g.endDraw();
    addHeaderControl(headerBackground);
    
    next = new GButton(p, w - 40, 0, 40, 40);
    next.setText(">");
    next.addEventHandler(this, "onNext");
    next.fireAllEvents(true);
    addHeaderControl(next);
    
    previous = new GButton(p, w - 80, 0, 40, 40);
    previous.setText("<");
    previous.addEventHandler(this, "onPrevious");
    previous.fireAllEvents(true);
    addHeaderControl(previous);
  }
  
  public void addHeaderControl(GAbstractControl control) {
    super.addControl(control);
  }
  
  public void addControl(GAbstractControl control) {
    super.addControl(control);
    views.add(control);
  }
  
  public void dispose() {
    super.dispose();
    headerBackground.dispose();
    next.dispose();
    previous.dispose();
    disposeChildren();
  }
  
  private void disposeChildren() {
    for(GAbstractControl view : views) {
      view.dispose();
    }
    views.clear();
  }


  
  public void onNext(GButton button, GEvent event) {
    if (event != GEvent.CLICKED && event != GEvent.RELEASED) {
      return;
    }
    int total = elements.size() / pageSize;
    if (elements.size() % pageSize > 0) {
      total += 1;
    }
    if (page + 1 >= total) {
      return;
    }
    page += 1;
    disposeChildren();
    onCreatePage();
  }
  
  public void onPrevious(GButton button, GEvent event) {
    if (event != GEvent.CLICKED && event != GEvent.RELEASED) {
      return;
    }
    if (page - 1 < 0) {
      return;
    }
    page -= 1;
    disposeChildren();
    onCreatePage();
  }
  
  public void onCreatePage() {
    int offset = page * pageSize;
    for(int i = offset; i < 9 + offset && i < elements.size(); i++) {
      int xoffset = ((i - offset) % 3) * 100 + 10;
      int yoffset = ((i - offset) / 3) * 120 + 40;
      addElementView(elements.get(i), xoffset, yoffset);
    }
  }
  
  protected void addElementView(Object element, int x, int y) {
  }
}
