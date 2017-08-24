import { CoreExcoWebPage } from './app.po';

describe('core-exco-web App', function() {
  let page: CoreExcoWebPage;

  beforeEach(() => {
    page = new CoreExcoWebPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
