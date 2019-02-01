(defrule p1
	(declare(salience 100))
    =>
    (printout t "Are you at home? [Answer: YES/NO] " crlf )
	(assert (are_you_at_home (read)))
)
(defrule p2
    (declare(salience 99))
	(are_you_at_home YES)
	=>
	(printout t "Are you alone?  [Answer: YES/NO]" crlf)
	(assert (are_you_alone (read)))
)

(defrule h1
	(are_you_at_home NO)
	=>
	(printout t "SELECT one of the option: " crlf
	"DINNER: TYPE 'D' " crlf
	"RESTAURANT: TYPE 'R' " crlf
	"CAMPING: TYPE 'C' " crlf
	"DRINKING IN PUBLIC: TYPE 'P' " crlf
	"SPECIAL OCCASIONS: TYPE 'S'" crlf
	"----------------------- " crlf)
	(assert (on_the_go (read)))
)

(defrule h5
	(on_the_go D)
	=>
	(printout t "Is the wine the main course? [Answer: YES/NO]" crlf)
	(assert (main_course (read)))
)

(defrule h6
	(on_the_go R)
	=>
	(printout t "Fancy? [Answer: YES/NO]" crlf)
	(assert (fancy (read)))
)

(defrule p23
	(fancy YES)
	=>
	(printout t "Can you pronounce the menu?  [Answer: YES/NO]" crlf)
	(assert (pronounce_menu (read)))
)

(defrule p20
	(fancy NO)
	=>
	(printout t "You should order California Carbanet" crlf)
)

(defrule p21
	(pronounce_menu YES)
	=>
	(printout t "You should go for Borduex or Burgandy" crlf)
	(assert (pronounce_menu (read)))
)

(defrule p22
	(pronounce_menu NO)
	=>
	(printout t "You should just order Cotes Du Rhune" crlf)
	(assert (pronounce_menu (read)))
)

(defrule h7
	(on_the_go C)
	=>
	(printout t "yet to add recommendation" crlf)
)

(defrule h8
	(on_the_go P)
	=>
	(printout t "You should buy Single Serve Box Wine" crlf)
)

(defrule h9
	(on_the_go S)
	=>
	(printout t "TYPE special occasion: " crlf
	"BIRTHDAY: B" crlf
	"ANNIVERSARY: A" crlf
	"NEW YEAR: N" crlf
    )
    (assert (occassion (read)))
)

(defrule p17
	(occassion B)
	=>
	(printout t "You can drink Riesling or Chenin Blanc (Something Swift)" crlf)
)

(defrule p18
	(occassion A)
	=>
	(printout t "The amazing California Pinor Noir (Hedonistic Joy Ride)" crlf)
)
(defrule p19
	(occassion N)
	=>
	(printout t "Spanish Cava (Cheap Bubbly)" crlf)
)

    
(defrule h2
	(on_the_go D)
	(main_course YES)
	=> 
	(printout t "SANGIOVESE or GRENACHE [go for something exotic...]" crlf)
)

(defrule h3
	(are_you_alone NO)
	=>
	(assert (on_the_go D))
)



(defrule p3
    (are_you_at_home YES)
	(are_you_alone YES)
	=> 
	(printout t "Recovering from work? [Answer: YES/NO]" crlf)
	(assert (recover_from_work (read)))
)

(defrule p4
	(are_you_alone YES)
	(recover_from_work YES)
	=>
	(printout t "The best choice is: PINOT NOIR [sniff your glass off]" crlf)
)

(defrule p5
	(are_you_alone YES)
	(recover_from_work NO)
	=>
	(printout t "Getting drunk? [Answer: YES/NO]"crlf)
	(assert(getting_drunk (read)))
)	
	
(defrule p6
	(recover_from_work NO)
	(getting_drunk YES)
	=> 
	(printout t "The best choice is: ZINFANDEL or SHIRAZ [go for high octane]" crlf)
)	
	
(defrule p7
    (recover_from_work NO)
	(getting_drunk NO)
	=>
	(printout t "Feeling fancy? [Answer: YES/NO]" crlf)
	(assert(feeling_fancy (read)))	
)	
	
(defrule p8
	(getting_drunk NO)
	(feeling_fancy YES)
	=> 
	(printout t "SANGIOVESE or GRENACHE [go for something exotic]" crlf)
)
	
(defrule p9 
	(getting_drunk NO)
	(feeling_fancy NO)
	=>
	(printout t "Do you prefer DAILY DRINKING WINE? [Answer: YES/NO]" crlf)
	(assert(daily_drinking_wine (read)))
)	
(defrule p10
	(feeling_fancy NO)
	(daily_drinking_wine YES)
	=> 
	(printout t "KOOL-AID MAN? [Answer: YES/NO]" crlf)
	(assert (kool_aid_man (read)))
)

(defrule p11
	(daily_drinking_wine YES)
	(kool_aid_man YES)
	=>
	(printout t "ARGENTINIAN MALBEC [fruit forward wine]" crlf)
)

(defrule p12
	(daily_drinking_wine YES)
	(kool_aid_man NO)
	=>
	(printout t "Eat dirt as a child? [Print: Yes/No]" crlf)
	(assert (eat_dirt (read)))
)

(defrule p13
	(kool_aid_man NO)
	(eat_dirt YES)
	=> 
	(printout t "CHINON or BOURGUEIL [something earthy]" crlf)
)

(defrule p14 
	(kool_aid_man NO)
	(eat_dirt NO)
	=>
	(printout t "Ready to spray butter in your mouth? Answer: Yes/No" crlf)
	(assert (butter (read)))
)

(defrule p15
	(eat_dirt NO)
	(butter YES)
	=>
	(printout t "BUTTERY CHARDONNAY [please bring me my...] "crlf)
)

(defrule p16 
	(eat_dirt NO)
	(butter NO)
    (daily_drinking_wine NO)
	=>
	(printout t "Enough of playing. Get out of here!!!" crlf)
)


	
(deffunction init()
    (reset)
    (run)
    )
(init)