package sap.menus;

class TitleState extends State
{
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