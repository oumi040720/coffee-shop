��U S E   [ m a s t e r ]  
 G O  
 / * * * * * *   O b j e c t :     D a t a b a s e   [ c o f f e e _ s h o p ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 1   * * * * * * /  
 C R E A T E   D A T A B A S E   [ c o f f e e _ s h o p ]   O N     P R I M A R Y    
 (   N A M E   =   N ' c o f f e e _ s h o p ' ,   F I L E N A M E   =   N ' C : \ P r o g r a m   F i l e s \ M i c r o s o f t   S Q L   S e r v e r \ M S S Q L 1 0 _ 5 0 . S Q L E X P R E S S \ M S S Q L \ D A T A \ c o f f e e _ s h o p . m d f '   ,   S I Z E   =   2 3 0 4 K B   ,   M A X S I Z E   =   U N L I M I T E D ,   F I L E G R O W T H   =   1 0 2 4 K B   )  
   L O G   O N    
 (   N A M E   =   N ' c o f f e e _ s h o p _ l o g ' ,   F I L E N A M E   =   N ' C : \ P r o g r a m   F i l e s \ M i c r o s o f t   S Q L   S e r v e r \ M S S Q L 1 0 _ 5 0 . S Q L E X P R E S S \ M S S Q L \ D A T A \ c o f f e e _ s h o p _ l o g . L D F '   ,   S I Z E   =   5 0 4 K B   ,   M A X S I Z E   =   2 0 4 8 G B   ,   F I L E G R O W T H   =   1 0 % )  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   C O M P A T I B I L I T Y _ L E V E L   =   1 0 0  
 G O  
 I F   ( 1   =   F U L L T E X T S E R V I C E P R O P E R T Y ( ' I s F u l l T e x t I n s t a l l e d ' ) )  
 b e g i n  
 E X E C   [ c o f f e e _ s h o p ] . [ d b o ] . [ s p _ f u l l t e x t _ d a t a b a s e ]   @ a c t i o n   =   ' e n a b l e '  
 e n d  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   A N S I _ N U L L _ D E F A U L T   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   A N S I _ N U L L S   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   A N S I _ P A D D I N G   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   A N S I _ W A R N I N G S   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   A R I T H A B O R T   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   A U T O _ C L O S E   O N  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   A U T O _ C R E A T E _ S T A T I S T I C S   O N  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   A U T O _ S H R I N K   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   A U T O _ U P D A T E _ S T A T I S T I C S   O N  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   C U R S O R _ C L O S E _ O N _ C O M M I T   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   C U R S O R _ D E F A U L T     G L O B A L  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   C O N C A T _ N U L L _ Y I E L D S _ N U L L   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   N U M E R I C _ R O U N D A B O R T   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   Q U O T E D _ I D E N T I F I E R   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   R E C U R S I V E _ T R I G G E R S   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T     E N A B L E _ B R O K E R  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   A U T O _ U P D A T E _ S T A T I S T I C S _ A S Y N C   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   D A T E _ C O R R E L A T I O N _ O P T I M I Z A T I O N   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   T R U S T W O R T H Y   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   A L L O W _ S N A P S H O T _ I S O L A T I O N   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   P A R A M E T E R I Z A T I O N   S I M P L E  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   R E A D _ C O M M I T T E D _ S N A P S H O T   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   H O N O R _ B R O K E R _ P R I O R I T Y   O F F  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T     R E A D _ W R I T E  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   R E C O V E R Y   S I M P L E  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T     M U L T I _ U S E R  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   P A G E _ V E R I F Y   C H E C K S U M  
 G O  
 A L T E R   D A T A B A S E   [ c o f f e e _ s h o p ]   S E T   D B _ C H A I N I N G   O F F  
 G O  
 U S E   [ c o f f e e _ s h o p ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ s t a f f _ l o g s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 S E T   A N S I _ P A D D I N G   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ s t a f f _ l o g s ] (  
 	 [ i d ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ c r e a t e d _ d a t e ]   [ d a t e t i m e ]   N U L L ,  
 	 [ c r e a t e d _ b y ]   [ v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ m o d i f i e d _ d a t e ]   [ d a t e t i m e ]   N U L L ,  
 	 [ m o d i f i e d _ b y ]   [ v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ s t a f f _ i d ]   [ b i g i n t ]   N U L L ,  
 	 [ o l d _ f u l l n a m e ]   [ n v a r c h a r ] ( 2 5 5 )   N U L L ,  
 	 [ o l d _ b i r t h d a y ]   [ d a t e ]   N U L L ,  
 	 [ o l d _ e m a i l ]   [ v a r c h a r ] ( 2 5 5 )   N U L L ,  
 	 [ o l d _ p h o n e ]   [ v a r c h a r ] ( 1 5 )   N U L L ,  
 	 [ o l d _ a d d r e s s ]   [ n v a r c h a r ] ( 2 5 5 )   N U L L ,  
 	 [ o l d _ p h o t o ]   [ n v a r c h a r ] ( 2 5 5 )   N U L L ,  
 	 [ o l d _ u s e r _ i d ]   [ b i g i n t ]   N U L L ,  
 	 [ o l d _ u s e r n a m e ]   [ v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ o l d _ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 S E T   A N S I _ P A D D I N G   O F F  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ u n i t s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ u n i t s ] (  
 	 [ i d ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ u n i t _ n a m e ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ o r d e r _ l o g s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 S E T   A N S I _ P A D D I N G   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ o r d e r _ l o g s ] (  
 	 [ i d ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ c r e a t e d _ d a t e ]   [ d a t e t i m e ]   N U L L ,  
 	 [ c r e a t e d _ b y ]   [ v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ m o d i f i e d _ d a t e ]   [ d a t e t i m e ]   N U L L ,  
 	 [ m o d i f i e d _ b y ]   [ v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ o r d e r _ i d ]   [ b i g i n t ]   N U L L ,  
 	 [ o r d e r _ d e t a i l _ i d ]   [ b i g i n t ]   N U L L ,  
 	 [ o l d _ p r o d u c t _ i d ]   [ v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ o l d _ q u a n t i t y ]   [ i n t ]   N U L L ,  
 	 [ o l d _ o r d e r _ d a t e ]   [ d a t e t i m e ]   N U L L ,  
 	 [ o l d _ o r d e r _ c o d e ]   [ v a r c h a r ] ( 1 5 )   N U L L ,  
 	 [ o l d _ s t a t u s ]   [ i n t ]   N U L L ,  
 	 [ o l d _ c u s t o m e r _ i d ]   [ v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ o l d _ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 S E T   A N S I _ P A D D I N G   O F F  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ c o u p o n s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 S E T   A N S I _ P A D D I N G   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ c o u p o n s ] (  
 	 [ i d ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ c o u p o n _ c o d e ]   [ v a r c h a r ] ( 1 5 )   N O T   N U L L ,  
 	 [ d i s c o u n t ]   [ v a r c h a r ] ( 1 0 )   N O T   N U L L ,  
 	 [ m i n _ t o t a l _ b i l l ]   [ f l o a t ]   N U L L ,  
 	 [ m a x _ d i s c o u n t ]   [ v a r c h a r ] ( 1 0 )   N U L L ,  
 	 [ s t a r t _ t i m e ]   [ d a t e t i m e ]   N O T   N U L L ,  
 	 [ e n d _ t i m e ]   [ d a t e t i m e ]   N O T   N U L L ,  
 	 [ t y p e ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ] ,  
 U N I Q U E   N O N C L U S T E R E D    
 (  
 	 [ c o u p o n _ c o d e ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 S E T   A N S I _ P A D D I N G   O F F  
 G O  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ c o u p o n s ]   O N  
 I N S E R T   [ d b o ] . [ c o u p o n s ]   ( [ i d ] ,   [ c o u p o n _ c o d e ] ,   [ d i s c o u n t ] ,   [ m i n _ t o t a l _ b i l l ] ,   [ m a x _ d i s c o u n t ] ,   [ s t a r t _ t i m e ] ,   [ e n d _ t i m e ] ,   [ t y p e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 ,   N ' F R E E S H I P ' ,   N ' 1 0 0 % ' ,   3 0 0 0 0 0 ,   N ' 1 0 0 % ' ,   C A S T ( 0 x 0 0 0 0 A B 3 5 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   C A S T ( 0 x 0 0 0 0 D 7 6 F 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' M i �n   P h �   V �n   C h u y �n ' ,   0 )  
 I N S E R T   [ d b o ] . [ c o u p o n s ]   ( [ i d ] ,   [ c o u p o n _ c o d e ] ,   [ d i s c o u n t ] ,   [ m i n _ t o t a l _ b i l l ] ,   [ m a x _ d i s c o u n t ] ,   [ s t a r t _ t i m e ] ,   [ e n d _ t i m e ] ,   [ t y p e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 ,   N ' F S 0 0 1 ' ,   N ' 2 0 0 0 0 ' ,   2 5 0 0 0 0 ,   N ' 1 0 0 % ' ,   C A S T ( 0 x 0 0 0 0 A B 3 5 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   C A S T ( 0 x 0 0 0 0 D 7 6 F 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' M i �n   P h �   V �n   C h u y �n ' ,   0 )  
 I N S E R T   [ d b o ] . [ c o u p o n s ]   ( [ i d ] ,   [ c o u p o n _ c o d e ] ,   [ d i s c o u n t ] ,   [ m i n _ t o t a l _ b i l l ] ,   [ m a x _ d i s c o u n t ] ,   [ s t a r t _ t i m e ] ,   [ e n d _ t i m e ] ,   [ t y p e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 ,   N ' G I A M 1 0 ' ,   N ' 1 0 0 0 0 ' ,   1 0 0 0 0 0 ,   N ' 1 0 0 0 0 ' ,   C A S T ( 0 x 0 0 0 0 A C 9 7 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   C A S T ( 0 x 0 0 0 0 A C A 2 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' G i �m   G i �   T r �c   T i �p ' ,   0 )  
 I N S E R T   [ d b o ] . [ c o u p o n s ]   ( [ i d ] ,   [ c o u p o n _ c o d e ] ,   [ d i s c o u n t ] ,   [ m i n _ t o t a l _ b i l l ] ,   [ m a x _ d i s c o u n t ] ,   [ s t a r t _ t i m e ] ,   [ e n d _ t i m e ] ,   [ t y p e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 ,   N ' C H I 2 0 2 0 ' ,   N ' 1 0 % ' ,   1 5 0 0 0 0 ,   N ' 5 0 0 0 0 ' ,   C A S T ( 0 x 0 0 0 0 A C 9 7 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   C A S T ( 0 x 0 0 0 0 A C A 2 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' G i �m   G i �   T h e o   P h �n   T r m ' ,   0 )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ c o u p o n s ]   O F F  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ c a t e g o r i e s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 S E T   A N S I _ P A D D I N G   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ c a t e g o r i e s ] (  
 	 [ i d ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ c a t e g o r y _ n a m e ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ c a t e g o r y _ c o d e ]   [ v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ] ,  
 U N I Q U E   N O N C L U S T E R E D    
 (  
 	 [ c a t e g o r y _ c o d e ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 S E T   A N S I _ P A D D I N G   O F F  
 G O  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ c a t e g o r i e s ]   O N  
 I N S E R T   [ d b o ] . [ c a t e g o r i e s ]   ( [ i d ] ,   [ c a t e g o r y _ n a m e ] ,   [ c a t e g o r y _ c o d e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 ,   N ' C �   P h � ' ,   N ' c a - p h e ' ,   0 )  
 I N S E R T   [ d b o ] . [ c a t e g o r i e s ]   ( [ i d ] ,   [ c a t e g o r y _ n a m e ] ,   [ c a t e g o r y _ c o d e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 ,   N ' T r � ' ,   N ' t r a ' ,   0 )  
 I N S E R T   [ d b o ] . [ c a t e g o r i e s ]   ( [ i d ] ,   [ c a t e g o r y _ n a m e ] ,   [ c a t e g o r y _ c o d e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 ,   N ' T r �   S �a ' ,   N ' t r a - s u a ' ,   0 )  
 I N S E R T   [ d b o ] . [ c a t e g o r i e s ]   ( [ i d ] ,   [ c a t e g o r y _ n a m e ] ,   [ c a t e g o r y _ c o d e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 ,   N ' S i n h   T �' ,   N ' s i n h - t o ' ,   0 )  
 I N S E R T   [ d b o ] . [ c a t e g o r i e s ]   ( [ i d ] ,   [ c a t e g o r y _ n a m e ] ,   [ c a t e g o r y _ c o d e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 ,   N ' N ��c   T r � i   C � y ' ,   N ' n u o c - t r a i - c a y ' ,   0 )  
 I N S E R T   [ d b o ] . [ c a t e g o r i e s ]   ( [ i d ] ,   [ c a t e g o r y _ n a m e ] ,   [ c a t e g o r y _ c o d e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 6 ,   N ' S �a   C h u a ' ,   N ' s u a - c h u a ' ,   0 )  
 I N S E R T   [ d b o ] . [ c a t e g o r i e s ]   ( [ i d ] ,   [ c a t e g o r y _ n a m e ] ,   [ c a t e g o r y _ c o d e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 7 ,   N ' B � n h ' ,   N ' b a n h ' ,   0 )  
 I N S E R T   [ d b o ] . [ c a t e g o r i e s ]   ( [ i d ] ,   [ c a t e g o r y _ n a m e ] ,   [ c a t e g o r y _ c o d e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 8 ,   N ' a ' ,   N ' a b ' ,   1 )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ c a t e g o r i e s ]   O F F  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ p r o d u c t _ l o g s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 S E T   A N S I _ P A D D I N G   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ p r o d u c t _ l o g s ] (  
 	 [ i d ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ c r e a t e d _ d a t e ]   [ d a t e t i m e ]   N U L L ,  
 	 [ c r e a t e d _ b y ]   [ v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ m o d i f i e d _ d a t e ]   [ d a t e t i m e ]   N U L L ,  
 	 [ m o d i f i e d _ b y ]   [ v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ p r o d u c t _ i d ]   [ i n t ]   N U L L ,  
 	 [ o l d _ p r o d u c t _ n a m e ]   [ n v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ o l d _ p h o t o ]   [ v a r c h a r ] ( 2 5 5 )   N U L L ,  
 	 [ o l d _ p r i c e ]   [ m o n e y ]   N U L L ,  
 	 [ o l d _ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 	 [ o l d _ c a t e g o r y _ i d ]   [ i n t ]   N U L L ,  
 	 [ o l d _ c a t e g o r y _ n a m e ]   [ n v a r c h a r ] ( 5 0 )   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 S E T   A N S I _ P A D D I N G   O F F  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ i n p u t s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ i n p u t s ] (  
 	 [ i d ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ i n p u t _ d a t e ]   [ d a t e t i m e ]   N O T   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ i n p u t _ l o g s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 S E T   A N S I _ P A D D I N G   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ i n p u t _ l o g s ] (  
 	 [ i d ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ c r e a t e d _ d a t e ]   [ d a t e t i m e ]   N U L L ,  
 	 [ c r e a t e d _ b y ]   [ v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ m o d i f i e d _ d a t e ]   [ d a t e t i m e ]   N U L L ,  
 	 [ m o d i f i e d _ b y ]   [ v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ i n p u t _ i d ]   [ b i g i n t ]   N U L L ,  
 	 [ i n p u t _ d e t a i l _ i d ]   [ b i g i n t ]   N U L L ,  
 	 [ o l d _ i n p u t _ d a t e ]   [ d a t e t i m e ]   N U L L ,  
 	 [ o l d _ q u a n t i t y ]   [ r e a l ]   N U L L ,  
 	 [ o l d _ u n i t _ i d ]   [ i n t ]   N U L L ,  
 	 [ o l d _ i n g r e d i e n t _ i d ]   [ i n t ]   N U L L ,  
 	 [ o l d _ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 S E T   A N S I _ P A D D I N G   O F F  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ r o l e s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 S E T   A N S I _ P A D D I N G   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ r o l e s ] (  
 	 [ i d ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ r o l e _ n a m e ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ r o l e _ c o d e ]   [ v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ] ,  
 U N I Q U E   N O N C L U S T E R E D    
 (  
 	 [ r o l e _ c o d e ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 S E T   A N S I _ P A D D I N G   O F F  
 G O  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ r o l e s ]   O N  
 I N S E R T   [ d b o ] . [ r o l e s ]   ( [ i d ] ,   [ r o l e _ n a m e ] ,   [ r o l e _ c o d e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 ,   N ' Q u �n   L � ' ,   N ' a d m i n ' ,   0 )  
 I N S E R T   [ d b o ] . [ r o l e s ]   ( [ i d ] ,   [ r o l e _ n a m e ] ,   [ r o l e _ c o d e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 ,   N ' T h u   N g � n ' ,   N ' c a s h i e r ' ,   0 )  
 I N S E R T   [ d b o ] . [ r o l e s ]   ( [ i d ] ,   [ r o l e _ n a m e ] ,   [ r o l e _ c o d e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 ,   N ' N g ��i   D � n g ' ,   N ' u s e r ' ,   0 )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ r o l e s ]   O F F  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ p r o d u c t s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 S E T   A N S I _ P A D D I N G   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ p r o d u c t s ] (  
 	 [ i d ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ p r o d u c t _ n a m e ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ p h o t o ]   [ v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ p r i c e ]   [ m o n e y ]   N O T   N U L L ,  
 	 [ c a t e g o r y _ i d ]   [ i n t ]   N O T   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 S E T   A N S I _ P A D D I N G   O F F  
 G O  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ p r o d u c t s ]   O N  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 ,   N ' S �a   C h u a   X o � i   � c   T h �m ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 6 5 a 7 d 0 2 8 c 2 2 2 9 d - s a c h u a x o i c t h m p h c l o n g . p n g ' ,   6 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 ,   N ' S �a   C h u a   P h � c   B �n   T �  � c   C a m ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 4 1 3 6 b 3 7 1 5 b f f 3 e - s a c h u a p h c b n t c c a m p h c l o n g . p n g ' ,   6 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 ,   N ' T r �   O L o n g   �  L �n h ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / c 4 8 6 3 8 c 4 f 5 c 9 d c - o l o n g . p n g ' ,   3 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 ,   N ' T r �   N � n   T � m   �  L �n h ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 0 a 3 a f 3 1 3 c e 9 3 b 2 - t r a u l a n h n o n t o m . p n g ' ,   3 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 ,   N ' T r �   L � i   �  L �n h ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 4 8 e c 6 c 0 f 0 2 9 e 1 e - j a s m i n e . p n g ' ,   2 8 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 6 ,   N ' H �n g   T r �   � c   C a m ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / d a e 7 2 7 e 0 3 e 8 0 9 2 - d a c c a m . p n g ' ,   6 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 7 ,   N ' T r �   L � i   � c   T h �m ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / b 8 f 1 d d 4 d 4 f 5 8 3 c - d a c t h o m . p n g ' ,   5 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 8 ,   N ' T r �   �   L o n g   s �a ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 0 1 1 1 e e d 6 c 4 8 9 f 1 - t r s a p h c l o n g . p n g ' ,   4 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 9 ,   N ' T r �   s �a   P h � c   L o n g ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 2 c 5 f f d b 6 e b d 6 5 1 - t r s a p h c l o n g . p n g ' ,   4 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 0 ,   N ' T r �   � o ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 3 9 3 7 4 7 6 a 6 4 a 2 1 3 - t r o p h c l o n g . p n g ' ,   5 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 1 ,   N ' T r �   N h � n   -   S e n ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 7 c 8 0 0 6 f 7 2 7 4 2 d 8 - t r n h n p h c l o n g . p n g ' ,   4 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 2 ,   N ' T r �   N h � n   -   L � i ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 0 0 5 a a e e d 6 6 0 4 7 3 - t r n h n p h c l o n g . p n g ' ,   4 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 3 ,   N ' T r �   V �i   -   L � i ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 0 6 3 5 5 5 c 2 1 c 4 2 0 6 - t r v i l i p h c l o n g . p n g ' ,   4 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 4 ,   N ' T r �   V �i   -   S e n ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / e 1 6 0 9 5 1 b a 0 1 7 f e - t r v i l i p h c l o n g . p n g ' ,   4 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 5 ,   N ' T r �   T h �o   M �c ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 5 a 8 9 3 d a 4 c a b 4 8 7 - t r t h o m c p h c l o n g . p n g ' ,   4 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 6 ,   N ' H �n g   t r �   s �a ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / d 9 8 6 f 8 9 0 8 c d d 2 7 - t r s a p h c l o n g . p n g ' ,   4 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 7 ,   N ' T r �   C o c k t a i l   P h � c   L o n g ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 5 3 1 6 b 0 4 0 0 6 d 8 5 6 - t r c o c k t a i l p h c l o n g . p n g ' ,   5 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 8 ,   N ' T r �   � o   s �a ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / c 6 0 5 6 c 9 d d a 0 a f 3 - t r s a p h c l o n g . p n g ' ,   4 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 9 ,   N ' H �n g   t r �   v �i ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 4 7 4 2 e e 8 9 6 5 1 5 f 2 - h n g t r v i . p n g ' ,   4 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 0 ,   N ' T r �   x a n h   L a t t e ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / d 6 f b 6 a 8 a 9 2 f e 4 0 - t r x a n h l a t t e . p n g ' ,   4 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 1 ,   N ' T r �   H o a   H �n g ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 4 e e f 9 2 9 2 d b 8 8 1 0 - t r h o a h n g p h c l o n g . p n g ' ,   4 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 2 ,   N ' H �n g   t r �   c h a n h ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 8 4 b 7 8 c 9 f 8 1 6 e 9 1 - l e m o n b l a c k t e a . p n g ' ,   4 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 3 ,   N ' T r �   �   L o n g   D � u ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 2 3 f b c 8 f c 3 1 8 8 4 c - d u p . p n g ' ,   4 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 4 ,   N ' T r �   s �a   C �   p h �   v �i   k e m   t ��i ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 1 1 9 3 5 a 6 d 0 4 f 6 f a - t r s a c p h v i k e m t i . p n g ' ,   5 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 5 ,   N ' C �   p h �   P h � c   b �n   t �  H �n h   n h � n   �   x a y ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 5 8 f d 4 3 b 1 1 d 4 7 0 1 - e s p r e s s o r a s p b e r r y a l m o n d . p n g ' ,   6 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 6 ,   N ' T r �   x a n h   �   x a y ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 0 1 0 d d a 1 6 6 7 9 4 b c - t r x a n h x a y p h c l o n g . p n g ' ,   5 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 7 ,   N ' T r �   � o   �   x a y ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 8 3 1 6 8 a b a 0 0 8 2 8 b - t r o x a y p h c l o n g . p n g ' ,   6 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 8 ,   N ' C �   p h �   D �a   x a y   v �   t h �c h ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / a 2 e c 4 0 d f 9 5 3 4 4 c - c p h d a x a y v t h c h p h c l o n g . p n g ' ,   6 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 9 ,   N ' S � - c � - l a   C �   p h �   �   x a y ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 4 7 2 6 c 0 4 9 4 a 3 e 2 5 - s c l a c p h x a y . p n g ' ,   5 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 0 ,   N ' B � n h   O r e o   x a y   c � n g   c �   p h �   C a p p u c c i n o ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 7 f a 4 f a 7 e 1 2 d 7 a 0 - b n h o r e o x a y c n g c p h . p n g ' ,   5 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 1 ,   N ' T r �   x a n h   x a y   c � n g   H �n h   n h � n ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / a d 3 1 f 3 f 0 f 2 e c 8 7 - t r x a n h x a y a l m o n d . p n g ' ,   6 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 2 ,   N ' T r �   x a n h   C �   p h �   x a y   v �   t h �c h ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 1 9 b b 4 a 0 3 0 8 9 e c a - t r x a n h c p h x a y v t h c h . p n g ' ,   6 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 3 ,   N ' S � - c � - l a   x a y   c � n g   H �n h   n h � n   v �   E s p r e s s o ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 0 6 4 d d b 7 d f b 4 7 b 1 - s c l a x a y v i h n h n h n v e s p r e s s o p h c l o n g . p n g ' ,   5 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 4 ,   N ' C �   p h �   C a p p u c c i n o   �   x a y ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / d b 0 5 5 8 d b 9 6 d c b 4 - t r s a c p h v i k e m t i . p n g ' ,   5 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 5 ,   N ' C �   p h �   B �c   h �   �   x a y ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / d f 9 0 9 3 5 9 f 5 8 3 5 8 - c p h b c h x a y p h c l o n g . p n g ' ,   5 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 6 ,   N ' S � - c � - l a   t r �n g   �   x a y ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / b 3 1 7 2 e 9 2 3 0 c 1 8 5 - s c l a c p h x a y . p n g ' ,   5 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 7 ,   N ' T r �   x a n h   C �   p h �   x a y   c � n g   H �n h   n h � n ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 8 0 8 a d 2 0 d 2 2 7 6 2 7 - c p h t r x a n h x a y a l m o n d . p n g ' ,   6 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 8 ,   N ' C �   p h �   C a r a m e l   �   x a y ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 0 8 3 7 c 5 a 3 2 d d 5 f e - c p h c a r a m e l x a y p h c l o n g . p n g ' ,   5 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 9 ,   N ' C a r a m e l   �   x a y ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 0 7 c 7 7 c c 0 b 1 7 3 e d - c a r a m e l x a y p h c l o n g . p n g ' ,   5 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 0 ,   N ' T � o   v �   D � u   � p ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 8 2 d 9 4 9 5 c 7 5 a 9 f 0 - t o v d u p . j p g ' ,   5 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 1 ,   N ' B ��i   � p ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 6 3 1 b 6 2 0 b 6 0 3 a d c - b i p . p n g ' ,   4 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 2 ,   N ' D � u   � p ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 6 b 1 a 2 8 9 7 1 b e c 0 0 - d u p . p n g ' ,   5 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 3 ,   N ' T h �m   v �   D � u   � p ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 1 6 f 4 0 3 1 1 f 8 a 5 7 e - d a v d u p p h c l o n g . p n g ' ,   5 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 4 ,   N ' T � o   � p ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 1 c 2 8 e 9 8 e 3 c f 7 6 6 - t o p p h c l o n g . p n g ' ,   4 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 5 ,   N ' D �a   � p ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 6 2 9 5 9 0 5 d c 9 4 4 7 e - d a p p h c l o n g . p n g ' ,   4 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 6 ,   N ' C a m   � p ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / c 6 0 a b b 5 6 1 e 3 8 1 7 - c a m p . p n g ' ,   4 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 7 ,   N ' �i   � p ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / c 0 f 1 f d b a 4 f 6 0 3 6 - i . p n g ' ,   4 0 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 8 ,   N ' S i n h   t �  C h u �i ,   D � u ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / b c 6 7 7 7 6 d 3 f 1 4 8 5 - s i n h t c h u i d u p h c l o n g . p n g ' ,   4 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 9 ,   N ' V i t a m i n   C   ( X o � i ,   C a m ,   C h a n h   d � y ) ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / e 0 f 1 8 b 7 4 8 d f e 7 d - s i n h t x o i p h c l o n g . p n g ' ,   5 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] ,   [ p r o d u c t _ n a m e ] ,   [ p h o t o ] ,   [ p r i c e ] ,   [ c a t e g o r y _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 0 ,   N ' S i n h   t �  D � u ' ,   N ' h t t p s : / / p h u c l o n g . c o m . v n / u p l o a d s / d i s h / 4 a 6 2 5 d 6 5 6 4 e 6 9 4 - s i n h t d u . p n g ' ,   5 5 0 0 0 . 0 0 0 0 ,   1 ,   0 )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ p r o d u c t s ]   O F F  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ i n g r e d i e n t s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ i n g r e d i e n t s ] (  
 	 [ i d ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ n a m e ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ q u a n t i t y ]   [ r e a l ]   N O T   N U L L ,  
 	 [ u n i t _ i d ]   [ i n t ]   N O T   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ u s e r s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 S E T   A N S I _ P A D D I N G   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ u s e r s ] (  
 	 [ i d ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ u s e r n a m e ]   [ v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ p a s s w o r d ]   [ v a r c h a r ] ( m a x )   N O T   N U L L ,  
 	 [ r o l e _ i d ]   [ i n t ]   N O T   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ] ,  
 U N I Q U E   N O N C L U S T E R E D    
 (  
 	 [ u s e r n a m e ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]   T E X T I M A G E _ O N   [ P R I M A R Y ]  
 G O  
 S E T   A N S I _ P A D D I N G   O F F  
 G O  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ u s e r s ]   O N  
 I N S E R T   [ d b o ] . [ u s e r s ]   ( [ i d ] ,   [ u s e r n a m e ] ,   [ p a s s w o r d ] ,   [ r o l e _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 ,   N ' a d m i n ' ,   N ' l w s j / S + O l k k 4 N c 1 P P R k K G p T t S m o B b v s 9 G l W k R k 0 t Y o f O S x 5 j r W U u T + J a s 6 K F j 9 d w 2 4 m 0 r G t V 2 P l 9 A M e e x 2 H y A g 1 S e c Z k / s H Y i e 5 u z k x d f o y V T l P C v H T a / b 9 q z 8 R K 8 R q v V c K 6 o R l I d c n p Z 9 z R C c x x 6 e + C Q K / x Q k Y P k 1 o 3 P I n E w J b T z 3 6 j I d U C 5 7 z x u V z P W 5 R b 5 O o r 5 P v v n I T 3 U b f i M P T Z R E k r T H P Y 1 p 6 g U V i D e p o 3 z M 9 Q P 9 2 n 7 t I V B / r 0 d D g w Z F V V I O v h / 0 R b u d M p 0 x w z 3 8 o W A o y O T X 9 o n O C B / i x h L m 1 2 i y e + e A d 9 H l C J O j i H o 7 g p c N x Y t 3 B 2 H y Q k u o y u 3 7 D + O 0 H B e w = = ' ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ u s e r s ]   ( [ i d ] ,   [ u s e r n a m e ] ,   [ p a s s w o r d ] ,   [ r o l e _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 ,   N ' c a s h i e r ' ,   N ' N 9 6 3 p o Y A 3 F I R a N Y n Y M B M t U i V V H h l Y w z z 5 g Z 1 f 6 F m R Z Z y r M 4 w 0 T T s F P j V m Y E V c K F Q F K D K Z S 0 2 L P N j 2 o C z 7 I 4 X k o 4 3 1 3 4 1 u r E D 6 f 4 1 q O / r g J F E J G R Z I n 7 v e f p K 9 F 8 C K 7 + v G n 5 U + f P d g q G i h U 0 h + i T / 7 r + f U U p M + q o z 1 1 V D h 5 N 9 X m D / X s / m K i 3 U e z L z J L w b V 6 7 B y 0 + j l S h / 9 v 2 7 g X c + l K 1 k 7 L V w f C h U 8 S X t f d l i m z I s + y g R X e + g Y T 3 j U S D d O 0 L q I Z D X G M g 7 Z B I I t h 0 8 7 B G p K g u K U I V Z s O 8 m J W j E y Y u 1 1 2 t K A K h q M D q W 4 z i 9 l 9 t 6 W R 6 V Z u y / g S K f u M Z o q i D I k o B 5 w m l A 4 w = = ' ,   2 ,   0 )  
 I N S E R T   [ d b o ] . [ u s e r s ]   ( [ i d ] ,   [ u s e r n a m e ] ,   [ p a s s w o r d ] ,   [ r o l e _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 ,   N ' u s e r ' ,   N ' S B s Y H z J R v V n u K w 1 f C B m n x 6 9 U v m i 9 A O L a r E B E P 3 n 0 V O 9 0 w 6 x R b c f H V 9 H I g F u 7 g C F H I v P H Y Z J j u l I s T l B p B W g 0 1 R R u A n z 6 q X v O + R N 4 s z E m A e r k I D X w v h O g b Z Y t 8 7 i U e q d E I m h v V M b V Y v w g w u 9 T 0 3 0 O u G C 3 U 6 1 O A y S + 8 h m H b g w I l N l U c D t U x f l O R k k l 7 f k 6 0 d l F b i N i S C S w j D B t 8 i c K m + p p d a + N 9 F O / k t x v a b e h h u J / j j Y 0 l k P 6 j S 7 w q r 6 Z / S l L s 4 0 q a g w A J L a j Z l V k 6 u d o b u c 8 6 w K w N C 4 c b n 5 Y 7 e L N w J w h 5 a A I V E / u M B J S Q U r F G m + E Y m l e c C l S 6 z d 5 l t M 9 g v P D p G 9 B R Q = = ' ,   3 ,   0 )  
 I N S E R T   [ d b o ] . [ u s e r s ]   ( [ i d ] ,   [ u s e r n a m e ] ,   [ p a s s w o r d ] ,   [ r o l e _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 ,   N ' t e o n v ' ,   N ' d D g v o n u J K w / e 4 w + n 1 m S l 9 M I f 6 e o D e 0 l b 6 a H z K o N R D a a I y a E B J P H h 8 o 1 B C c b p W 5 b j m V A u 0 0 S r h k B x t W q / O q n L u U 1 U 2 a B 5 k F k Y u h W P f B i h f 5 V w x u i O b K i g E L E O h B d 9 z r n 8 t 6 4 w L G 0 4 U I 0 K K M x a K d U q 4 N 2 S i b E Q W f z b D p F d R a S l Z Z l Z 0 2 n 2 u i c 1 e r A g 3 f e v b 9 c d X z I P k s e h q d i l 1 6 t 0 o r u Q Z A M L 7 K R q C T R V Y z 9 Z s E Y l x 3 4 O X N 2 A 3 Z A / V d X i C U 2 I i r n C R 3 z 1 z 1 N Z d U g E t w U k n + l i A C B A Z 2 I p O 3 1 Y t / J y O / d f k z s s w j 4 6 P m 2 R b k r V t M 8 T R U j q L Q C g V J h s G 4 S 7 Y R b d 1 u l u y A = = ' ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ u s e r s ]   ( [ i d ] ,   [ u s e r n a m e ] ,   [ p a s s w o r d ] ,   [ r o l e _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 ,   N ' t i n v ' ,   N ' U S / F J Z P H c g 6 Q h V G Q f 9 R c S 2 o D q G P l X H y y W b j 2 C 6 Y v Y g V + u 6 j e 3 F s o a q E i 5 G e Y b s 1 L b x Z k Q o Y Z Y V E r a a Z 0 c m 5 Z j B T p / t z K R C G O X d O x i i E F u F 5 B s R q w A z D E I t 3 u V Y F v 4 r + b G W y d D w q J J R J y E Z u A N 6 I v 7 x p Y S f c s t + m N c x w y a K F R p J T 9 k r A s z R 8 Y y A Q 6 t 0 2 k M 8 n E E w 4 L I N d s I 6 5 a f O t a o J 1 L + l t P C x O e s a C V k c f 3 q j 1 x y 9 I 7 4 L Z E l t u 0 5 B U 1 9 M J N z 4 8 i I M G D z O 4 2 K o P O K 9 B y t 8 n z 0 5 c z 3 X 6 C G g l 0 t A / d q 1 g 1 w 3 0 G A 1 S y D u i h 2 t G O Z K G V b v V G 1 x F / o s E N O u s k q N t J o J B s F Q = = ' ,   2 ,   0 )  
 I N S E R T   [ d b o ] . [ u s e r s ]   ( [ i d ] ,   [ u s e r n a m e ] ,   [ p a s s w o r d ] ,   [ r o l e _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 6 ,   N ' n o n t ' ,   N ' Q 2 8 O 1 0 u G V + 8 4 1 4 n L f s A T T 6 L I Z + j o S Q w p M 4 B R 3 y U i v 3 i m K U w L 7 B m M 6 p k h H C E s 0 r / p d e P o G + U k R n v d 8 q L l 9 5 e q v R I a c j + 8 K L C 2 9 2 e V D M N 3 F y Q 2 4 x f + G 6 3 5 E s e V V N M q V k n x f r 8 R r m C L h Y k m 4 H w X S k C v S z r E R I Q t h t M c o J F 3 v K Y T 8 2 L P g 3 / c E c e V D e g x P L Y j 5 n s e E d c 6 T K i g 0 W R K H Z R z J A c c q w / 1 J X + M w d Q v 6 E t M r V v y G k f V 9 L Q 9 J G g t R v 9 5 G W w c E s c B n 9 j s O A 8 / 4 x v s a I X z 3 Q n A E / G L h r I 7 Y C / N l p p o d 4 h J S l N Z z w d y p / P D L p L V n b q 0 9 + I j f j b K C q Z U 6 6 K R i B K 3 5 m d 7 i Q = = ' ,   3 ,   0 )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ u s e r s ]   O F F  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ s t a f f s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 S E T   A N S I _ P A D D I N G   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ s t a f f s ] (  
 	 [ i d ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ f u l l n a m e ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ b i r t h d a y ]   [ d a t e ]   N O T   N U L L ,  
 	 [ e m a i l ]   [ v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ p h o n e ]   [ v a r c h a r ] ( 1 5 )   N O T   N U L L ,  
 	 [ a d d r e s s ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ p h o t o ]   [ v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ u s e r _ i d ]   [ b i g i n t ]   N O T   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 S E T   A N S I _ P A D D I N G   O F F  
 G O  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ s t a f f s ]   O N  
 I N S E R T   [ d b o ] . [ s t a f f s ]   ( [ i d ] ,   [ f u l l n a m e ] ,   [ b i r t h d a y ] ,   [ e m a i l ] ,   [ p h o n e ] ,   [ a d d r e s s ] ,   [ p h o t o ] ,   [ u s e r _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 ,   N ' A d m i n ' ,   C A S T ( 0 x 0 7 2 4 0 B 0 0   A S   D a t e ) ,   N ' a d m i n @ c o f f e e s h o p . c o m . v n ' ,   N ' 0 9 8 8 5 4 2 3 2 6 ' ,   N ' B � n h   D ��n g ' ,   N ' h t t p s : / / i . i m g u r . c o m / h U c T e E a . j p g ' ,   1 ,   0 )  
 I N S E R T   [ d b o ] . [ s t a f f s ]   ( [ i d ] ,   [ f u l l n a m e ] ,   [ b i r t h d a y ] ,   [ e m a i l ] ,   [ p h o n e ] ,   [ a d d r e s s ] ,   [ p h o t o ] ,   [ u s e r _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 ,   N ' C a s h i e r ' ,   C A S T ( 0 x 0 7 2 4 0 B 0 0   A S   D a t e ) ,   N ' c a s h i e r @ c o f f e e s h o p . c o m . v n ' ,   N ' 0 9 8 7 5 3 2 3 2 6 ' ,   N ' T P   H �  C h �   M i n h ' ,   N ' h t t p s : / / i . i m g u r . c o m / i Y 2 J f T 3 . j p g ' ,   2 ,   0 )  
 I N S E R T   [ d b o ] . [ s t a f f s ]   ( [ i d ] ,   [ f u l l n a m e ] ,   [ b i r t h d a y ] ,   [ e m a i l ] ,   [ p h o n e ] ,   [ a d d r e s s ] ,   [ p h o t o ] ,   [ u s e r _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 ,   N ' N g u y �n   V n   T � o ' ,   C A S T ( 0 x 0 7 2 4 0 B 0 0   A S   D a t e ) ,   N ' t e o n v @ c o f f e e s h o p . c o m . v n ' ,   N ' 0 9 8 8 5 4 2 3 2 6 ' ,   N ' B � n h   D ��n g ' ,   N ' h t t p s : / / i . i m g u r . c o m / 1 O E 3 y o j . j p g ' ,   4 ,   0 )  
 I N S E R T   [ d b o ] . [ s t a f f s ]   ( [ i d ] ,   [ f u l l n a m e ] ,   [ b i r t h d a y ] ,   [ e m a i l ] ,   [ p h o n e ] ,   [ a d d r e s s ] ,   [ p h o t o ] ,   [ u s e r _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 ,   N ' N g u y �n   V n   T � ' ,   C A S T ( 0 x 0 7 2 4 0 B 0 0   A S   D a t e ) ,   N ' t i n v @ c o f f e e s h o p . c o m . v n ' ,   N ' 0 9 8 8 0 5 2 3 7 5 ' ,   N ' B �   R �a   V in g   T � u ' ,   N ' h t t p s : / / i . i m g u r . c o m / h A c u 4 4 U . j p g ' ,   5 ,   0 )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ s t a f f s ]   O F F  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ c u s t o m e r s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 S E T   A N S I _ P A D D I N G   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ c u s t o m e r s ] (  
 	 [ i d ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ f u l l n a m e ]   [ n v a r c h a r ] ( 2 5 5 )   N U L L ,  
 	 [ e m a i l ]   [ v a r c h a r ] ( 2 5 5 )   N U L L ,  
 	 [ p h o n e ]   [ v a r c h a r ] ( 1 5 )   N U L L ,  
 	 [ a d d r e s s ]   [ n v a r c h a r ] ( 2 5 5 )   N U L L ,  
 	 [ u s e r _ i d ]   [ b i g i n t ]   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 S E T   A N S I _ P A D D I N G   O F F  
 G O  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ c u s t o m e r s ]   O N  
 I N S E R T   [ d b o ] . [ c u s t o m e r s ]   ( [ i d ] ,   [ f u l l n a m e ] ,   [ e m a i l ] ,   [ p h o n e ] ,   [ a d d r e s s ] ,   [ u s e r _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 ,   N ' U s e r   C u s t o m e r ' ,   N ' u s e r _ c u s t o m e r @ g m a i l . c o m ' ,   N ' 0 9 8 8 5 3 2 4 5 6 ' ,   N ' C a o   �n g   F P T   P o l y t e c h n i c ,   C � n g   v i � n   P h �n   M �m   Q u a n g   T r u n g ,   Q u �n   1 2 ,   T h � n h   P h �  H �  C h �   M i n h ' ,   3 ,   0 )  
 I N S E R T   [ d b o ] . [ c u s t o m e r s ]   ( [ i d ] ,   [ f u l l n a m e ] ,   [ e m a i l ] ,   [ p h o n e ] ,   [ a d d r e s s ] ,   [ u s e r _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 ,   N ' N g u y �n   T h �  N �' ,   N ' n o n t _ c u s t o m e r @ g m a i l . c o m ' ,   N ' 0 9 8 8 5 3 2 4 5 6 ' ,   N ' C a o   �n g   F P T   P o l y t e c h n i c ,   N a m   K �  K h �i   N g h )a ,   Q u �n   3 ,   T h � n h   P h �  H �  C h �   M i n h ' ,   3 ,   0 )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ c u s t o m e r s ]   O F F  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ i n p u t _ d e t a i l s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ i n p u t _ d e t a i l s ] (  
 	 [ i d ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ q u a n t i t y ]   [ r e a l ]   N O T   N U L L ,  
 	 [ p r i c e ]   [ m o n e y ]   N O T   N U L L ,  
 	 [ u n i t _ i d ]   [ i n t ]   N O T   N U L L ,  
 	 [ i n g r e d i e n t _ i d ]   [ i n t ]   N O T   N U L L ,  
 	 [ i n p u t _ i d ]   [ b i g i n t ]   N O T   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ p r i c e _ h i s t o r i e s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ p r i c e _ h i s t o r i e s ] (  
 	 [ i d ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ s t a r t _ d a t e ]   [ d a t e t i m e ]   N O T   N U L L ,  
 	 [ e n d _ d a t e ]   [ d a t e t i m e ]   N U L L ,  
 	 [ p r i c e ]   [ m o n e y ]   N O T   N U L L ,  
 	 [ p r o d u c t _ i d ]   [ i n t ]   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ o r d e r s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 S E T   A N S I _ P A D D I N G   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ o r d e r s ] (  
 	 [ i d ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ o r d e r _ d a t e ]   [ d a t e t i m e ]   N O T   N U L L ,  
 	 [ o r d e r _ c o d e ]   [ v a r c h a r ] ( 1 5 )   N O T   N U L L ,  
 	 [ s t a t u s ]   [ i n t ]   N O T   N U L L ,  
 	 [ a d d r e s s ]   [ n v a r c h a r ] ( 2 5 5 )   N U L L ,  
 	 [ p h o n e ]   [ v a r c h a r ] ( 1 5 )   N U L L ,  
 	 [ t o t a l _ p r i c e ]   [ f l o a t ]   N U L L ,  
 	 [ n o t e ]   [ n v a r c h a r ] ( m a x )   N U L L ,  
 	 [ c u s t o m e r _ i d ]   [ b i g i n t ]   N U L L ,  
 	 [ c o u p o n _ i d ]   [ b i g i n t ]   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]   T E X T I M A G E _ O N   [ P R I M A R Y ]  
 G O  
 S E T   A N S I _ P A D D I N G   O F F  
 G O  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ o r d e r s ]   O N  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 ,   C A S T ( 0 x 0 0 0 0 A 9 C 8 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' a 2 0 1 9 ' ,   5 ,   N U L L ,   N U L L ,   1 3 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 ,   C A S T ( 0 x 0 0 0 0 A 9 E 7 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' b 2 0 1 9 ' ,   5 ,   N U L L ,   N U L L ,   3 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 ,   C A S T ( 0 x 0 0 0 0 A A 0 3 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' c 2 0 1 9 ' ,   5 ,   N U L L ,   N U L L ,   1 0 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 ,   C A S T ( 0 x 0 0 0 0 A A 2 2 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' d 2 0 1 9 ' ,   5 ,   N U L L ,   N U L L ,   1 1 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 ,   C A S T ( 0 x 0 0 0 0 A A 4 0 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' e 2 0 1 9 ' ,   5 ,   N U L L ,   N U L L ,   1 1 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 6 ,   C A S T ( 0 x 0 0 0 0 A A 5 F 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' f 2 0 1 9 ' ,   5 ,   N U L L ,   N U L L ,   1 2 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 7 ,   C A S T ( 0 x 0 0 0 0 A A 7 D 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' g 2 0 1 9 ' ,   5 ,   N U L L ,   N U L L ,   1 2 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 8 ,   C A S T ( 0 x 0 0 0 0 A A 9 C 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' h 2 0 1 9 ' ,   5 ,   N U L L ,   N U L L ,   1 6 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 9 ,   C A S T ( 0 x 0 0 0 0 A A B B 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' i 2 0 1 9 ' ,   5 ,   N U L L ,   N U L L ,   1 1 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 0 ,   C A S T ( 0 x 0 0 0 0 A A D 9 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' k 2 0 1 9 ' ,   5 ,   N U L L ,   N U L L ,   6 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 1 ,   C A S T ( 0 x 0 0 0 0 A A F 8 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' u 2 0 1 9 ' ,   5 ,   N U L L ,   N U L L ,   6 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 2 ,   C A S T ( 0 x 0 0 0 0 A B 1 6 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' p 2 0 1 9 ' ,   5 ,   N U L L ,   N U L L ,   1 0 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 3 ,   C A S T ( 0 x 0 0 0 0 A B 3 5 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' a q y h k ' ,   5 ,   N U L L ,   N U L L ,   1 3 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 4 ,   C A S T ( 0 x 0 0 0 0 A C 6 D 0 1 3 E D B D E   A S   D a t e T i m e ) ,   N ' 8 1 x g O E u ' ,   0 ,   N ' a ' ,   N ' a ' ,   4 5 0 0 0 ,   N ' a ' ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 5 ,   C A S T ( 0 x 0 0 0 0 A C 6 E 0 0 E 0 1 0 9 9   A S   D a t e T i m e ) ,   N ' G F p n a j 3 ' ,   0 ,   N ' a ' ,   N ' a ' ,   7 0 0 0 0 ,   N ' a ' ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 6 ,   C A S T ( 0 x 0 0 0 0 A B 5 4 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' j d l j j l k ' ,   5 ,   N ' ' ,   N U L L ,   1 3 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 7 ,   C A S T ( 0 x 0 0 0 0 A B 5 5 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' j l k j ' ,   5 ,   N U L L ,   N U L L ,   3 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 8 ,   C A S T ( 0 x 0 0 0 0 A B 5 6 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' k k k w ' ,   5 ,   N U L L ,   N U L L ,   4 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 9 ,   C A S T ( 0 x 0 0 0 0 A B 5 7 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' j h g n ' ,   5 ,   N U L L ,   N U L L ,   7 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 0 ,   C A S T ( 0 x 0 0 0 0 A B 5 8 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' h ? k h k j h ' ,   5 ,   N U L L ,   N U L L ,   7 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 1 ,   C A S T ( 0 x 0 0 0 0 A B 5 9 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' k n u w ' ,   5 ,   N U L L ,   N U L L ,   1 1 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 2 ,   C A S T ( 0 x 0 0 0 0 A B 5 A 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' k n l l ' ,   5 ,   N U L L ,   N U L L ,   1 1 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 3 ,   C A S T ( 0 x 0 0 0 0 A B 5 B 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' j n m ' ,   5 ,   N U L L ,   N U L L ,   3 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 4 ,   C A S T ( 0 x 0 0 0 0 A B 5 C 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' j j j j j ' ,   5 ,   N U L L ,   N U L L ,   3 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 5 ,   C A S T ( 0 x 0 0 0 0 A B 5 D 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' u u e ' ,   5 ,   N U L L ,   N U L L ,   4 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 6 ,   C A S T ( 0 x 0 0 0 0 A B 5 E 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' 1 5 3 d 1 f ' ,   5 ,   N U L L ,   N U L L ,   8 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 7 ,   C A S T ( 0 x 0 0 0 0 A B 5 F 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' l j l e u ' ,   5 ,   N U L L ,   N U L L ,   1 6 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 8 ,   C A S T ( 0 x 0 0 0 0 A B 6 0 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' k h j ' ,   5 ,   N U L L ,   N U L L ,   3 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 9 ,   C A S T ( 0 x 0 0 0 0 A B 6 1 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' k l l 2 1 3 2 ' ,   5 ,   N U L L ,   N U L L ,   4 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 0 ,   C A S T ( 0 x 0 0 0 0 A B 6 2 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' j k l j l k ' ,   6 ,   N U L L ,   N U L L ,   8 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 1 ,   C A S T ( 0 x 0 0 0 0 A B 6 3 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' j l d l j ' ,   5 ,   N U L L ,   N U L L ,   1 3 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 2 ,   C A S T ( 0 x 0 0 0 0 A B 6 4 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' d j f j l ' ,   5 ,   N U L L ,   N U L L ,   1 7 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 3 ,   C A S T ( 0 x 0 0 0 0 A B 6 5 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' l j k l j ' ,   5 ,   N U L L ,   N U L L ,   2 0 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 4 ,   C A S T ( 0 x 0 0 0 0 A B 6 6 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' j l j l k ' ,   5 ,   N U L L ,   N U L L ,   6 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 5 ,   C A S T ( 0 x 0 0 0 0 A B 6 7 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' j y w j b ' ,   5 ,   N U L L ,   N U L L ,   1 3 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 6 ,   C A S T ( 0 x 0 0 0 0 A B 6 8 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' q e r r ' ,   5 ,   N U L L ,   N U L L ,   1 6 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 7 ,   C A S T ( 0 x 0 0 0 0 A B 6 9 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' ? e l d h ' ,   5 ,   N U L L ,   N U L L ,   2 1 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 8 ,   C A S T ( 0 x 0 0 0 0 A B 6 A 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' q u j h f ' ,   5 ,   N U L L ,   N U L L ,   3 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 9 ,   C A S T ( 0 x 0 0 0 0 A B 6 B 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' j g f j l ' ,   5 ,   N U L L ,   N U L L ,   7 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 0 ,   C A S T ( 0 x 0 0 0 0 A B 6 C 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' s f f ' ,   5 ,   N U L L ,   N U L L ,   4 0 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 1 ,   C A S T ( 0 x 0 0 0 0 A B 6 D 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' s d 6 ' ,   5 ,   N U L L ,   N U L L ,   1 1 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 2 ,   C A S T ( 0 x 0 0 0 0 A B 6 E 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' d l j f l k j ' ,   5 ,   N U L L ,   N U L L ,   3 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 4 ,   C A S T ( 0 x 0 0 0 0 A B 6 F 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' l j l ' ,   5 ,   N U L L ,   N U L L ,   1 1 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 5 ,   C A S T ( 0 x 0 0 0 0 A C 4 7 0 0 0 0 0 0 0 0   A S   D a t e T i m e ) ,   N ' j l j l a j l ' ,   5 ,   N U L L ,   N U L L ,   3 5 0 0 0 ,   N U L L ,   N U L L ,   N U L L ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r s ]   ( [ i d ] ,   [ o r d e r _ d a t e ] ,   [ o r d e r _ c o d e ] ,   [ s t a t u s ] ,   [ a d d r e s s ] ,   [ p h o n e ] ,   [ t o t a l _ p r i c e ] ,   [ n o t e ] ,   [ c u s t o m e r _ i d ] ,   [ c o u p o n _ i d ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 6 ,   C A S T ( 0 x 0 0 0 0 A C 7 0 0 0 A 7 F 9 8 F   A S   D a t e T i m e ) ,   N ' I 4 v t E L W ' ,   0 ,   N ' h ' ,   N ' h ' ,   9 3 0 0 0 ,   N ' h ' ,   N U L L ,   N U L L ,   0 )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ o r d e r s ]   O F F  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ o r d e r _ d e t a i l s ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ o r d e r _ d e t a i l s ] (  
 	 [ i d ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ q u a n t i t y ]   [ i n t ]   N O T   N U L L ,  
 	 [ p r o d u c t _ i d ]   [ i n t ]   N O T   N U L L ,  
 	 [ o r d e r _ i d ]   [ b i g i n t ]   N O T   N U L L ,  
 	 [ t o t a l _ m o n e y ]   [ f l o a t ]   N O T   N U L L ,  
 	 [ p r i c e ]   [ f l o a t ]   N O T   N U L L ,  
 	 [ f l a g _ d e l e t e ]   [ b i t ]   N U L L ,  
 P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ i d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   O N  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 ,   1 ,   1 ,   1 ,   6 5 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 ,   1 ,   2 ,   1 ,   6 5 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 ,   1 ,   3 ,   2 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 ,   2 ,   7 ,   3 ,   1 0 0 0 0 0 ,   5 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 ,   1 ,   1 ,   4 ,   6 5 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 6 ,   1 ,   2 3 ,   4 ,   4 5 0 0 0 ,   4 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 7 ,   1 ,   4 9 ,   5 ,   5 5 0 0 0 ,   5 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 8 ,   1 ,   5 0 ,   5 ,   5 5 0 0 0 ,   5 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 9 ,   1 ,   2 5 ,   6 ,   6 5 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 0 ,   1 ,   2 6 ,   6 ,   5 5 0 0 0 ,   5 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 1 ,   3 ,   4 7 ,   7 ,   1 2 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 2 ,   3 ,   4 7 ,   8 ,   1 2 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 3 ,   1 ,   4 6 ,   8 ,   4 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 4 ,   2 ,   3 5 ,   9 ,   1 1 0 0 0 0 ,   5 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 5 ,   1 ,   2 ,   1 0 ,   6 5 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 6 ,   1 ,   1 ,   1 1 ,   6 5 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 7 ,   1 ,   1 ,   1 2 ,   6 5 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 8 ,   1 ,   3 ,   1 2 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 1 9 ,   1 ,   1 ,   1 3 ,   6 5 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 0 ,   1 ,   2 ,   1 3 ,   6 5 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 1 ,   1 ,   1 1 ,   1 4 ,   4 5 0 0 0 ,   4 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 2 ,   1 ,   3 ,   1 5 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 3 ,   1 ,   4 ,   1 5 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 4 ,   1 ,   1 ,   1 6 ,   6 5 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 5 ,   1 ,   2 ,   1 6 ,   6 5 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 6 ,   1 ,   3 ,   1 7 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 7 ,   1 ,   1 1 ,   1 8 ,   4 5 0 0 0 ,   4 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 8 ,   2 ,   4 ,   1 9 ,   7 0 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 2 9 ,   2 ,   1 5 ,   2 0 ,   7 0 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 0 ,   2 ,   3 5 ,   2 1 ,   1 1 0 0 0 0 ,   5 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 1 ,   2 ,   3 5 ,   2 2 ,   1 1 0 0 0 0 ,   5 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 2 ,   1 ,   3 ,   2 3 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 3 ,   1 ,   3 ,   2 4 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 4 ,   1 ,   1 1 ,   2 5 ,   4 5 0 0 0 ,   4 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 5 ,   1 ,   3 ,   2 6 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 6 ,   1 ,   1 1 ,   2 6 ,   4 5 0 0 0 ,   4 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 7 ,   3 ,   4 7 ,   2 7 ,   1 2 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 8 ,   1 ,   4 6 ,   2 7 ,   4 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 3 9 ,   1 ,   3 ,   2 8 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 0 ,   1 ,   4 7 ,   2 9 ,   4 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 1 ,   2 ,   4 7 ,   3 0 ,   8 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 2 ,   2 ,   1 ,   3 1 ,   1 3 0 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 3 ,   2 ,   2 ,   3 2 ,   1 3 0 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 4 ,   1 ,   4 6 ,   3 2 ,   4 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 5 ,   2 ,   2 ,   3 3 ,   1 3 0 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 6 ,   1 ,   4 6 ,   3 3 ,   4 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 7 ,   1 ,   3 ,   3 3 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 8 ,   1 ,   2 ,   3 4 ,   6 5 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 4 9 ,   2 ,   2 ,   3 5 ,   1 3 0 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 0 ,   2 ,   1 ,   3 6 ,   1 3 0 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 1 ,   1 ,   3 ,   3 6 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 2 ,   2 ,   2 ,   3 7 ,   1 3 0 0 0 0 ,   6 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 3 ,   2 ,   4 6 ,   3 7 ,   8 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 4 ,   1 ,   3 ,   3 8 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 5 ,   1 ,   3 ,   3 9 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 6 ,   1 ,   4 6 ,   3 9 ,   4 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 7 ,   1 ,   4 6 ,   3 9 ,   4 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 8 ,   2 ,   4 6 ,   4 0 ,   8 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 5 9 ,   1 ,   3 ,   4 0 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 6 0 ,   1 ,   3 ,   4 1 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 6 1 ,   1 ,   3 ,   4 2 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 6 2 ,   1 ,   3 ,   4 4 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 6 3 ,   2 ,   4 6 ,   4 4 ,   8 0 0 0 0 ,   4 0 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 6 4 ,   1 ,   3 ,   4 5 ,   3 5 0 0 0 ,   3 5 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 6 5 ,   1 ,   5 ,   4 6 ,   2 8 0 0 0 ,   2 8 0 0 0 ,   0 )  
 I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   ( [ i d ] ,   [ q u a n t i t y ] ,   [ p r o d u c t _ i d ] ,   [ o r d e r _ i d ] ,   [ t o t a l _ m o n e y ] ,   [ p r i c e ] ,   [ f l a g _ d e l e t e ] )   V A L U E S   ( 6 6 ,   1 ,   6 ,   4 6 ,   6 5 0 0 0 ,   6 5 0 0 0 ,   0 )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ o r d e r _ d e t a i l s ]   O F F  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ s p _ o r d e r D e t a i l S t a t i s t i c ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 3   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 c r e a t e   p r o c   [ d b o ] . [ s p _ o r d e r D e t a i l S t a t i s t i c ]   ( @ y e a r   i n t ,   @ m o n t h   i n t )  
 a s  
 	 s e l e c t   ( s e l e c t   C O U N T ( * )   f r o m   o r d e r s   w h e r e   M O N T H ( o r d e r s . o r d e r _ d a t e )   =   @ m o n t h   a n d   Y E A R ( o r d e r s . o r d e r _ d a t e )   =   @ y e a r )   a s   ' O R D E R S ' ,  
 	 	 	 S U M ( o d . q u a n t i t y   *   o d . t o t a l _ m o n e y )   a s   ' S A L E S ' ,  
 	 	 	 A V G ( o d . p r i c e )   a s   ' A V G   P R I C E ' ,  
 	 	 	 S U M ( o d . q u a n t i t y )   a s   ' Q U A N T I T Y '  
 	 f r o m   o r d e r s   o   j o i n   o r d e r _ d e t a i l s   o d  
 	 o n   o . i d   =   o d . o r d e r _ i d  
 	 w h e r e   M O N T H ( o . o r d e r _ d a t e )   =   @ m o n t h   a n d   Y E A R ( o . o r d e r _ d a t e )   =   @ y e a r  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ s p _ g e t S a l e s R a t e E v e r y M o t n h I n Y e a r ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 3   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 c r e a t e   p r o c   [ d b o ] . [ s p _ g e t S a l e s R a t e E v e r y M o t n h I n Y e a r ]   ( @ y e a r   i n t )  
 a s  
 	 s e l e c t   M O N T H ( o . o r d e r _ d a t e )   a s   ' M O N T H ' ,      
 	 	 ( (   S U M ( o d . q u a n t i t y   *   o d . p r i c e )   / (   s e l e c t   S U M ( o r d e r _ d e t a i l s . q u a n t i t y   *   o r d e r _ d e t a i l s . p r i c e )    
 	 	 	 	 	 	 	 	 	 	     f r o m   o r d e r s   j o i n   o r d e r _ d e t a i l s   o n   o r d e r s . i d   =   o r d e r _ d e t a i l s . o r d e r _ i d  
 	 	 	 	 	 	 	 	 	 	     w h e r e   Y E A R ( o r d e r _ d a t e )   =   @ y e a r  
 	 	 	 	 	 	 	 	 	 	     g r o u p   b y   Y E A R ( o r d e r _ d a t e ) )   )   *   1 0 0   )   a s   ' P E R C E N T '  
 	 f r o m   o r d e r s   o   j o i n   o r d e r _ d e t a i l s   o d  
 	 o n   o . i d   =   o d . o r d e r _ i d  
 	 w h e r e   Y E A R ( o . o r d e r _ d a t e )   =   @ y e a r  
 	 g r o u p   b y   M O N T H ( o . o r d e r _ d a t e )  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ s p _ g e t S a l e s R a t e E v e r y D a y I n M o n t h O f Y e a r ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 3   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 - -   p r o c  
 c r e a t e   p r o c   [ d b o ] . [ s p _ g e t S a l e s R a t e E v e r y D a y I n M o n t h O f Y e a r ]   ( @ y e a r   i n t ,   @ m o n t h   i n t )  
 a s  
 	 s e l e c t   D A Y ( o . o r d e r _ d a t e )   a s   ' M O N T H ' ,    
 	 	 ( (   S U M ( o d . q u a n t i t y   *   o d . p r i c e )   /   (   s e l e c t   S U M ( o r d e r _ d e t a i l s . q u a n t i t y   *   o r d e r _ d e t a i l s . p r i c e )    
 	 	 	 	 	 	 	 	 	 	       f r o m   o r d e r s   j o i n   o r d e r _ d e t a i l s   o n   o r d e r s . i d   =   o r d e r _ d e t a i l s . o r d e r _ i d  
 	 	 	 	 	 	 	 	 	 	       w h e r e   Y E A R ( o r d e r _ d a t e )   =   @ y e a r   a n d   M O N T H ( o r d e r _ d a t e )   =   @ m o n t h  
 	 	 	 	 	 	 	 	 	 	       g r o u p   b y   M O N T H ( o r d e r _ d a t e ) )   )   *   1 0 0   )   a s   ' P E R C E N T '  
 	 f r o m   o r d e r s   o   j o i n   o r d e r _ d e t a i l s   o d  
 	 o n   o . i d   =   o d . o r d e r _ i d  
 	 w h e r e   Y E A R ( o . o r d e r _ d a t e )   =   @ y e a r   a n d   M O N T H ( o . o r d e r _ d a t e )   =   @ m o n t h  
 	 g r o u p   b y   D A Y ( o . o r d e r _ d a t e )  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ s p _ g e t S a l e s E v e r y Y e a r ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 3   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 c r e a t e   p r o c   [ d b o ] . [ s p _ g e t S a l e s E v e r y Y e a r ]  
 a s  
 	 s e l e c t   Y E A R ( o . o r d e r _ d a t e )   a s   ' Y E A R ' ,    
 	 	       S U M ( o d . q u a n t i t y   *   o d . p r i c e )   a s   ' T O T A L   P R I C E ' ,    
 	 	       S U M ( o d . q u a n t i t y )   a s   ' Q U A N T I T Y '  
 	 f r o m   o r d e r s   o   j o i n   o r d e r _ d e t a i l s   o d  
 	 o n   o . i d   =   o d . o r d e r _ i d  
 	 g r o u p   b y   Y E A R ( o . o r d e r _ d a t e )  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ s p _ g e t S a l e s E v e r y M o n t h B y Y e a r ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 3   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 c r e a t e   p r o c   [ d b o ] . [ s p _ g e t S a l e s E v e r y M o n t h B y Y e a r ]   ( @ y e a r   i n t )  
 a s  
 	 s e l e c t   M O N T H ( o . o r d e r _ d a t e )   a s   ' M O N T H ' ,    
 	 	       S U M ( o d . q u a n t i t y   *   o d . p r i c e )   a s   ' T O T A L   P R I C E ' ,    
 	 	       S U M ( o d . q u a n t i t y )   a s   ' Q U A N T I T Y '  
 	 f r o m   o r d e r s   o   j o i n   o r d e r _ d e t a i l s   o d  
 	 o n   o . i d   =   o d . o r d e r _ i d  
 	 w h e r e   Y E A R ( o . o r d e r _ d a t e )   =   @ y e a r  
 	 g r o u p   b y   M O N T H ( o . o r d e r _ d a t e )  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ s p _ g e t S a l e s E v e r y D a y B y Y e a r A n d M o n t h ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 3   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 c r e a t e   p r o c   [ d b o ] . [ s p _ g e t S a l e s E v e r y D a y B y Y e a r A n d M o n t h ]   ( @ y e a r   i n t ,   @ m o n t h   i n t )  
 a s  
 	 s e l e c t   D A Y ( o . o r d e r _ d a t e )   a s   ' D A Y ' ,    
 	 	       S U M ( o d . q u a n t i t y   *   o d . p r i c e )   a s   ' T O T A L   P R I C E ' ,    
 	 	       S U M ( o d . q u a n t i t y )   a s   ' Q U A N T I T Y '  
 	 f r o m   o r d e r s   o   j o i n   o r d e r _ d e t a i l s   o d  
 	 o n   o . i d   =   o d . o r d e r _ i d  
 	 w h e r e   Y E A R ( o . o r d e r _ d a t e )   =   @ y e a r   a n d   M O N T H ( o . o r d e r _ d a t e )   =   @ m o n t h  
 	 g r o u p   b y   D A Y ( o . o r d e r _ d a t e )  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ u n i t s _ _ f l a g _ d e l e _ _ 4 1 2 E B 0 B 6 ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ u n i t s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ c o u p o n s _ _ f l a g _ d e _ _ 5 A E E 8 2 B 9 ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ c o u p o n s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ c a t e g o r i e _ _ f l a g _ _ _ 2 0 C 1 E 1 2 4 ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ c a t e g o r i e s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ i n p u t s _ _ f l a g _ d e l _ _ 4 A B 8 1 A F 0 ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ i n p u t s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ r o l e s _ _ f l a g _ d e l e _ _ 0 B C 6 C 4 3 E ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ r o l e s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ p r o d u c t s _ _ f l a g _ d _ _ 2 5 8 6 9 6 4 1 ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ p r o d u c t s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ i n g r e d i e n _ _ f l a g _ _ _ 4 5 F 3 6 5 D 3 ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ i n g r e d i e n t s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ u s e r s _ _ f l a g _ d e l e _ _ 0 4 2 5 A 2 7 6 ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ u s e r s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ s t a f f s _ _ f l a g _ d e l _ _ 1 0 8 B 7 9 5 B ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ s t a f f s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ c u s t o m e r s _ _ f l a g _ _ _ 1 9 2 0 B F 5 C ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ c u s t o m e r s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ i n p u t _ d e t _ _ f l a g _ _ _ 4 F 7 C D 0 0 D ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ i n p u t _ d e t a i l s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ p r i c e _ h i s _ _ f l a g _ _ _ 2 E 1 B D C 4 2 ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ p r i c e _ h i s t o r i e s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ o r d e r s _ _ s t a t u s _ _ 3 2 E 0 9 1 5 F ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ o r d e r s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ s t a t u s ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ o r d e r s _ _ f l a g _ d e l _ _ 3 3 D 4 B 5 9 8 ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ o r d e r s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     D e f a u l t   [ D F _ _ o r d e r _ d e t _ _ f l a g _ _ _ 3 8 9 9 6 A B 5 ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ o r d e r _ d e t a i l s ]   A D D     D E F A U L T   ( ( 0 ) )   F O R   [ f l a g _ d e l e t e ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ f k _ m e n u _ c a t e g o r y ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ p r o d u c t s ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ f k _ m e n u _ c a t e g o r y ]   F O R E I G N   K E Y ( [ c a t e g o r y _ i d ] )  
 R E F E R E N C E S   [ d b o ] . [ c a t e g o r i e s ]   ( [ i d ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ p r o d u c t s ]   C H E C K   C O N S T R A I N T   [ f k _ m e n u _ c a t e g o r y ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ f k _ i n g r e d i e n t _ u n i t ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ i n g r e d i e n t s ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ f k _ i n g r e d i e n t _ u n i t ]   F O R E I G N   K E Y ( [ u n i t _ i d ] )  
 R E F E R E N C E S   [ d b o ] . [ u n i t s ]   ( [ i d ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ i n g r e d i e n t s ]   C H E C K   C O N S T R A I N T   [ f k _ i n g r e d i e n t _ u n i t ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ f k _ u s e r _ r o l e ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ u s e r s ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ f k _ u s e r _ r o l e ]   F O R E I G N   K E Y ( [ r o l e _ i d ] )  
 R E F E R E N C E S   [ d b o ] . [ r o l e s ]   ( [ i d ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ u s e r s ]   C H E C K   C O N S T R A I N T   [ f k _ u s e r _ r o l e ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ f k _ s t a f f _ u s e r ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ s t a f f s ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ f k _ s t a f f _ u s e r ]   F O R E I G N   K E Y ( [ u s e r _ i d ] )  
 R E F E R E N C E S   [ d b o ] . [ u s e r s ]   ( [ i d ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ s t a f f s ]   C H E C K   C O N S T R A I N T   [ f k _ s t a f f _ u s e r ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ f k _ c u s t o m e r _ u s e r ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ c u s t o m e r s ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ f k _ c u s t o m e r _ u s e r ]   F O R E I G N   K E Y ( [ u s e r _ i d ] )  
 R E F E R E N C E S   [ d b o ] . [ u s e r s ]   ( [ i d ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ c u s t o m e r s ]   C H E C K   C O N S T R A I N T   [ f k _ c u s t o m e r _ u s e r ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ f k _ i n p u t D e t a i l _ i n g r e d i e n t ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ i n p u t _ d e t a i l s ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ f k _ i n p u t D e t a i l _ i n g r e d i e n t ]   F O R E I G N   K E Y ( [ i n g r e d i e n t _ i d ] )  
 R E F E R E N C E S   [ d b o ] . [ i n g r e d i e n t s ]   ( [ i d ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ i n p u t _ d e t a i l s ]   C H E C K   C O N S T R A I N T   [ f k _ i n p u t D e t a i l _ i n g r e d i e n t ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ f k _ i n p u t D e t a i l _ i n p u t ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ i n p u t _ d e t a i l s ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ f k _ i n p u t D e t a i l _ i n p u t ]   F O R E I G N   K E Y ( [ i n p u t _ i d ] )  
 R E F E R E N C E S   [ d b o ] . [ i n p u t s ]   ( [ i d ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ i n p u t _ d e t a i l s ]   C H E C K   C O N S T R A I N T   [ f k _ i n p u t D e t a i l _ i n p u t ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ f k _ i n p u t D e t a i l _ u n i t ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ i n p u t _ d e t a i l s ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ f k _ i n p u t D e t a i l _ u n i t ]   F O R E I G N   K E Y ( [ u n i t _ i d ] )  
 R E F E R E N C E S   [ d b o ] . [ u n i t s ]   ( [ i d ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ i n p u t _ d e t a i l s ]   C H E C K   C O N S T R A I N T   [ f k _ i n p u t D e t a i l _ u n i t ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ f k _ p r i c e H i s t o r y _ p r o d u c t ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ p r i c e _ h i s t o r i e s ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ f k _ p r i c e H i s t o r y _ p r o d u c t ]   F O R E I G N   K E Y ( [ p r o d u c t _ i d ] )  
 R E F E R E N C E S   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ p r i c e _ h i s t o r i e s ]   C H E C K   C O N S T R A I N T   [ f k _ p r i c e H i s t o r y _ p r o d u c t ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ f k _ o r d e r _ c o u p o n ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ o r d e r s ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ f k _ o r d e r _ c o u p o n ]   F O R E I G N   K E Y ( [ c o u p o n _ i d ] )  
 R E F E R E N C E S   [ d b o ] . [ c o u p o n s ]   ( [ i d ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ o r d e r s ]   C H E C K   C O N S T R A I N T   [ f k _ o r d e r _ c o u p o n ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ f k _ o r d e r _ c u s t o m e r ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ o r d e r s ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ f k _ o r d e r _ c u s t o m e r ]   F O R E I G N   K E Y ( [ c u s t o m e r _ i d ] )  
 R E F E R E N C E S   [ d b o ] . [ c u s t o m e r s ]   ( [ i d ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ o r d e r s ]   C H E C K   C O N S T R A I N T   [ f k _ o r d e r _ c u s t o m e r ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ f k _ o r d e r D e t a i l _ o r d e r ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ o r d e r _ d e t a i l s ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ f k _ o r d e r D e t a i l _ o r d e r ]   F O R E I G N   K E Y ( [ o r d e r _ i d ] )  
 R E F E R E N C E S   [ d b o ] . [ o r d e r s ]   ( [ i d ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ o r d e r _ d e t a i l s ]   C H E C K   C O N S T R A I N T   [ f k _ o r d e r D e t a i l _ o r d e r ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ f k _ o r d e r D e t a i l _ p r o d u c t ]         S c r i p t   D a t e :   1 1 / 1 1 / 2 0 2 0   1 2 : 2 4 : 4 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ o r d e r _ d e t a i l s ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ f k _ o r d e r D e t a i l _ p r o d u c t ]   F O R E I G N   K E Y ( [ p r o d u c t _ i d ] )  
 R E F E R E N C E S   [ d b o ] . [ p r o d u c t s ]   ( [ i d ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ o r d e r _ d e t a i l s ]   C H E C K   C O N S T R A I N T   [ f k _ o r d e r D e t a i l _ p r o d u c t ]  
 G O  
 