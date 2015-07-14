package {
    import flash.display.Sprite;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import adobe.utils.MMExecute;
    import flash.external.ExternalInterface;
    import fl.controls.TextInput;
    import fl.controls.TextArea;

    public class jsflPanel extends Sprite {
        public function jsflPanel() {
            if (stage) {
                init();
            } else {
                addEventListener(Event.ADDED_TO_STAGE, init);
            }
        }

        private function init(e: Event = null): void {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            var textPanel = this.textPanel;
            this.runBtn.addEventListener(MouseEvent.CLICK, function (e: MouseEvent): void {
                var toolCode = [
                    'var log = function(text){fl.trace(text);};',
                    'window.doc = fl.doc = fl.getDocumentDOM();',
                    'if(doc){',
                    '    window.timeline = fl.timeline = doc.getTimeline();',
                    '    var layers = fl.layers = timeline.layers;',
                    '    var frames = fl.frames = layers[0].frames;',
                    '    if(frames[0]){',
                    '        var elems = fl.elems = frames[0].elements;',
                    '        fl.elem = elems[0];',
                    '   }',
                    '    window.lib = fl.doc.library;',
                    '}'
                ].join('');
                MMExecute(toolCode + textPanel.text);
            });
        }
    }
}