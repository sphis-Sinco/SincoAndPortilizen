package sap.menus;

enum abstract TitleSequences(String) from String to String {
        var DEBUG = 'debug';
        var INTRO = 'intro';
        var FLASH = 'flash';
        var COMPLETE = 'complete';
}

class TitleState extends State
{
        public static var SEQUENCE:TitleSequences = (Global.DEBUG_BUILD) ? DEBUG : INTRO;

        override public function new() {
                super('TitleState');
        }

        override function create() {
                super.create();

                var backdrop:SAPSprite = new SAPSprite({
                        position: [0,0],
                        imagePath: 'titlescreen/TitleBG',
                        scaleAddition: 1
                });
                add(backdrop);
                backdrop.screenCenter();
        }
        
}