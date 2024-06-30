declare var $: any;

class LoadingHelper {
  show() {
    $('#loader').show();
  }

  hide() {
    $('#loader').hide();
  }
}

export default new LoadingHelper();
