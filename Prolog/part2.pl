% knowlegde base
flight(istanbul,ankara,1).
flight(ankara,istanbul,1).
flight(antalya,izmir,2).
flight(izmir,antalya,2).
flight(izmir,istanbul,2).
flight(istanbul,izmir,2).
flight(erzincan,antalya,3).
flight(antalya,erzincan,3).
flight(van,gaziantep,3).
flight(gaziantep,van,3).
flight(ankara,van,4).
flight(van,ankara,4).
flight(antalya,diyarbakir,4).
flight(diyarbakir,antalya,4).
flight(istanbul,rize,4).
flight(rize,istanbul,4).
flight(rize,ankara,5).
flight(ankara,rize,5).
flight(canakkale,erzincan,6). 
flight(erzincan,canakkale,6). 
flight(izmir,ankara,6).
flight(ankara,izmir,6).
flight(diyarbakir,ankara,8).
flight(ankara,diyarbakir,8).

%rules
route(X,Y,C) :- route(X,Y,C,[]).
route(X,Y,C,Ok) :- flight(X,A,C1), not(member(A,Ok)),((Y = A, C is C1); (route(A,Y,C2,[X | Ok]),C is C2 + C1)). 