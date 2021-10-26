(set-logic UFLIRA)
(set-info :status unknown)
(declare-sort Fol 0)
(declare-fun VariantName (Real ) Bool)
(declare-fun Lane (Real ) Bool)
(declare-fun Speed (Real ) Bool)
(declare-fun Distance (Real ) Bool)
(declare-fun Zero (Real ) Bool)
(declare-fun ActionName (Fol ) Bool)
(declare-fun SuggestedAction (Real Fol ) Bool)
(declare-fun LaneSafe (Real Real Fol ) Bool)
(declare-fun LaneNotSafe (Real Real Fol ) Bool)
(declare-fun DistanceBehind (Real Real Real Real Fol ) Bool)
(declare-fun SpeedBehind (Real Real Real Real Fol ) Bool)
(declare-fun DistanceFront (Real Real Real Real Fol ) Bool)
(declare-fun SpeedFront (Real Real Real Real Fol ) Bool)
(declare-fun EgoCar (Real Real Real Real ) Bool)
(declare-fun ExcludedAction (Real Real Real Real Real Fol Real Real Real Real Real Real ) Bool)
(declare-fun SelfSuggestionDisproven (Real Real Real Real Real Fol Real Real Real Real Real Real ) Bool)
(declare-fun CertifiedVariant (Real ) Bool)
(declare-fun UpdatedVariant (Real ) Bool)
(declare-fun VariantSelfContradicting (Real Fol Real ) Bool)
(declare-fun VariantSelfContradictingInAction (Real Fol Real ) Bool)
(declare-fun ShouldNotUseLane (Real Real Real Real Real Fol Real Real Real Real Real Real ) Bool)
(declare-fun SafeActionDoesNotMatchChangeToLane (Real Real Real Real Real Fol ) Bool)
(declare-fun SafeDistanceSpeedFrontDisproven (Real Real Real Real Real Fol Real Real Real ) Bool)
(declare-fun SafeDistanceSpeedBehindDisproven (Real Real Real Real Real Fol Real Real Real ) Bool)
(declare-fun CaseSafeActionDoesNotMatchChangeToLane (Real Real Real Real Real Fol ) Bool)
(declare-fun SafeFrontDisproven (Real Real Real Real Real Fol Real Real Real ) Bool)
(declare-fun SafeBehindDisproven (Real Real Real Real Real Fol Real Real Real ) Bool)
(declare-fun CanUseLane (Real Real Fol Real Real Real Real Real Real Real Real Real ) Bool)
(declare-fun SuggestionExplained (Real Real Fol Real Real Real Real Real Real Real Real Real ) Bool)
(declare-fun SafeDistanceSpeedBehind (Real Real Real Real Real Fol Real Real Real ) Bool)
(declare-fun SafeDistanceSpeedFront (Real Real Real Real Real Fol Real Real Real ) Bool)
(declare-fun ActionMatchesChangeToLane (Real Real Real Real Real Fol ) Bool)
(declare-fun BehindIsSafe (Real Real Real Real Real Fol Real Real Real ) Bool)
(declare-fun FrontIsSafe (Real Real Real Real Real Fol Real Real Real ) Bool)
(declare-fun CaseActionMatchesChangeToLane (Real Real Real Real Real Fol ) Bool)
(declare-fun CanNotUseLane (Real Real Fol Real Real Real Real Real Real ) Bool)
(declare-fun NotSafeExplained (Real Real Fol Real Real Real Real Real Real Real ) Bool)
(declare-fun CaseCanNotUseLane1 (Real Real Fol Real Real Real Real Real Real ) Bool)
(declare-fun CaseCanNotUseLane2 (Real Real Fol Real Real Real Real Real Real ) Bool)
(declare-fun CaseCanNotUseLane3 (Real Real Fol Real Real Real Real Real Real ) Bool)
(declare-fun CaseCanNotUseLane4 (Real Real Fol Real Real Real Real Real Real ) Bool)
(declare-fun NotSafeDistanceSpeedBehind (Real Real Real Real Real Fol Real Real Real ) Bool)
(declare-fun NotSafeActionMatchesChangeToLane (Real Real Real Real Real Fol ) Bool)
(declare-fun NotSafeDistanceSpeedFront (Real Real Real Real Real Fol Real Real Real ) Bool)
(declare-fun SpeedLimit (Real Real Real Real Fol ) Bool)
(declare-fun CaseNotSafeActionMatchesChangeToLane (Real Real Real Real Real Fol ) Bool)
(declare-fun NotSafeBehind (Real Real Real Real Real Fol Real Real Real ) Bool)
(declare-fun NotSafeFront (Real Real Real Real Real Fol Real Real Real ) Bool)
(declare-fun ResultDeg (Real Real Real Real Real Real Real Real Real Real Real Fol ) Bool)
(declare-fun Neq (Real Real ) Bool)
(declare-fun amovestraight () Fol)
(declare-fun achangeleft () Fol)
(declare-fun achangeright () Fol)
(declare-fun adeceleratestraight () Fol)
(declare-fun adecelerateleft () Fol)
(declare-fun adecelerateright () Fol)
(declare-fun aacceleratestraight () Fol)
(declare-fun aaccelerateleft () Fol)
(declare-fun aaccelerateright () Fol)
(declare-fun GC0 () Int)
(declare-fun GC1 () Int)
(declare-fun GC2 () Int)
(declare-fun GC3 () Int)
(declare-fun GC4 () Int)
(declare-fun GC5 () Int)
(declare-fun GC6 () Int)
(declare-fun GC7 () Int)
(declare-fun GC8 () Int)
(declare-fun GC9 () Int)
(declare-fun GC10 () Int)
(declare-fun GC11 () Fol)
(assert (and 
(VariantName 0) 
(VariantName 1) 
(Lane 0) 
(Lane 1) 
(Lane 2) 
(Speed 0) 
(Speed 1) 
(Speed 2) 
(Speed 3) 
(Speed 4) 
(Speed 5) 
(Distance 0) 
(Distance 1) 
(Distance 2) 
(Distance 3) 
(Distance 4) 
(Distance 5) 
(Zero 0) 
(ActionName achangeright) 
(ActionName amovestraight) 
(ActionName achangeleft) 
(ActionName adeceleratestraight) 
(ActionName aacceleratestraight) 
(ActionName adecelerateright) 
(ActionName aaccelerateright) 
(ActionName adecelerateleft) 
(ActionName aaccelerateleft) 
(forall ((x0 Int) (x1 Fol) )(=> (and (VariantName x0) (ActionName x1) ) (SuggestedAction x0 x1) ))
(forall ((x0 Int) (x1 Int) (x2 Fol) )(=> (and (VariantName x0) (Lane x1) (ActionName x2) ) (LaneSafe x0 x1 x2) ))
(forall ((x0 Int) (x1 Int) (x2 Fol) )(=> (and (VariantName x0) (Lane x1) (ActionName x2) ) (LaneNotSafe x0 x1 x2) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Fol) )(=> (and (VariantName x0) (Lane x1) (Zero x2) (Distance x3) (ActionName x4) ) (DistanceBehind x0 x1 x2 x3 x4) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Fol) )(=> (and (VariantName x0) (Lane x1) (Zero x2) (Speed x3) (ActionName x4) ) (SpeedBehind x0 x1 x2 x3 x4) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Fol) )(=> (and (VariantName x0) (Lane x1) (Zero x2) (Distance x3) (ActionName x4) ) (DistanceFront x0 x1 x2 x3 x4) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Fol) )(=> (and (VariantName x0) (Lane x1) (Zero x2) (Speed x3) (ActionName x4) ) (SpeedFront x0 x1 x2 x3 x4) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) )(=> (and (VariantName x0) (Lane x1) (Zero x2) (Speed x3) ) (EgoCar x0 x1 x2 x3) ))
(forall ((x0 Int) (x1 Int) (x2 Fol) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int) (x11 Int) )(=> (and (VariantName x0) (LaneNotSafe x0 x1 x2) (EgoCar x0 x3 x4 x5) (DistanceBehind x0 x1 x6 x7 x2) (SpeedBehind x0 x1 x6 x8 x2) (DistanceFront x0 x1 x9 x10 x2) (SpeedFront x0 x1 x9 x11 x2) ) (ExcludedAction x0 x1 x3 x4 x5 x2 x6 x7 x8 x9 x10 x11) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int) (x11 Int) )(=> (and (VariantName x0) (SelfSuggestionDisproven x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11) ) (ExcludedAction x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Fol) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int) (x11 Int) (x12 Int) )(=> (and (CertifiedVariant x0) (UpdatedVariant x1) (LaneNotSafe x0 x2 x3) (EgoCar x1 x4 x5 x6) (DistanceBehind x1 x2 x7 x8 x3) (SpeedBehind x1 x2 x7 x9 x3) (DistanceFront x1 x2 x10 x11 x3) (SpeedFront x1 x2 x10 x12 x3) ) (ExcludedAction x1 x2 x4 x5 x6 x3 x7 x8 x9 x10 x11 x12) ))
(forall ((x0 Int) (x1 Fol) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int) (x11 Int) )(=> (and (VariantSelfContradicting x0 x1 x2) (ActionName x1) (EgoCar x0 x3 x4 x5) (DistanceBehind x0 x2 x6 x7 x1) (SpeedBehind x0 x2 x6 x8 x1) (DistanceFront x0 x2 x9 x10 x1) (SpeedFront x0 x2 x9 x11 x1) ) (ExcludedAction x0 x2 x3 x4 x5 x1 x6 x7 x8 x9 x10 x11) ))
(forall ((x0 Int) (x1 Int) (x2 Fol) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int) (x11 Int) (x12 Int) )(=> (and (CertifiedVariant x0) (UpdatedVariant x1) (VariantSelfContradicting x0 x2 x3) (EgoCar x1 x4 x5 x6) (DistanceBehind x1 x3 x7 x8 x2) (SpeedBehind x1 x3 x7 x9 x2) (DistanceFront x1 x3 x10 x11 x2) (SpeedFront x1 x3 x10 x12 x2) ) (ExcludedAction x1 x3 x4 x5 x6 x2 x7 x8 x9 x10 x11 x12) ))
(forall ((x0 Int) (x1 Int) (x2 Fol) )(=> (and (LaneSafe x0 x1 x2) (LaneNotSafe x0 x1 x2) (VariantName x0) ) (VariantSelfContradictingInAction x0 x2 x1) ))
(forall ((x0 Int) (x1 Fol) (x2 Int) )(=> (VariantSelfContradictingInAction x0 x1 x2) (VariantSelfContradicting x0 x1 x2) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int) (x11 Int) (x12 Int) )(=> (and (ShouldNotUseLane x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11) (LaneSafe x0 x12 x5) (SuggestedAction x0 x5) (VariantName x0) ) (SelfSuggestionDisproven x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int) (x11 Int) )(=> (and (SafeActionDoesNotMatchChangeToLane x0 x1 x2 x3 x4 x5) (DistanceBehind x0 x1 x6 x7 x5) (SpeedBehind x0 x1 x6 x8 x5) (DistanceFront x0 x1 x9 x10 x5) (SpeedFront x0 x1 x9 x11 x5) ) (ShouldNotUseLane x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int) (x11 Int) )(=> (and (SafeDistanceSpeedFrontDisproven x0 x1 x2 x3 x4 x5 x6 x7 x8) (DistanceBehind x0 x1 x9 x10 x5) (SpeedBehind x0 x1 x9 x11 x5) ) (ShouldNotUseLane x0 x1 x2 x3 x4 x5 x9 x10 x11 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int) (x11 Int) )(=> (and (SafeDistanceSpeedBehindDisproven x0 x1 x2 x3 x4 x5 x6 x7 x8) (DistanceFront x0 x1 x9 x10 x5) (SpeedFront x0 x1 x9 x11 x5) ) (ShouldNotUseLane x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) )(=> (CaseSafeActionDoesNotMatchChangeToLane x0 x1 x2 x3 x4 x5) (SafeActionDoesNotMatchChangeToLane x0 x1 x2 x3 x4 x5) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (Neq x0 x1) (LaneSafe x2 x0 amovestraight) (EgoCar x2 x1 x3 x4) ) (CaseSafeActionDoesNotMatchChangeToLane x2 x0 x1 x3 x4 amovestraight) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (Neq x0 x1) (LaneSafe x2 x0 adeceleratestraight) (EgoCar x2 x1 x3 x4) ) (CaseSafeActionDoesNotMatchChangeToLane x2 x0 x1 x3 x4 adeceleratestraight) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (Neq x0 x1) (LaneSafe x2 x0 aacceleratestraight) (EgoCar x2 x1 x3 x4) ) (CaseSafeActionDoesNotMatchChangeToLane x2 x0 x1 x3 x4 aacceleratestraight) ))
(forall ((x0 Real) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) )(=> (and (= x0 (+ x1 1)) (Neq x2 x0) (LaneSafe x3 x2 achangeleft) (EgoCar x3 x1 x4 x5) ) (CaseSafeActionDoesNotMatchChangeToLane x3 x2 x1 x4 x5 achangeleft) ))
(forall ((x0 Real) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) )(=> (and (= x0 (+ x1 1)) (Neq x2 x0) (LaneSafe x3 x2 adecelerateleft) (EgoCar x3 x1 x4 x5) ) (CaseSafeActionDoesNotMatchChangeToLane x3 x2 x1 x4 x5 adecelerateleft) ))
(forall ((x0 Real) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) )(=> (and (= x0 (+ x1 1)) (Neq x2 x0) (LaneSafe x3 x2 aaccelerateleft) (EgoCar x3 x1 x4 x5) ) (CaseSafeActionDoesNotMatchChangeToLane x3 x2 x1 x4 x5 aaccelerateleft) ))
(forall ((x0 Real) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) )(=> (and (= x0 (- x1 1)) (Neq x2 x0) (LaneSafe x3 x2 achangeright) (EgoCar x3 x1 x4 x5) (DistanceFront x3 x2 x6 x7 achangeright) (SpeedFront x3 x2 x6 x8 achangeright) ) (CaseSafeActionDoesNotMatchChangeToLane x3 x2 x1 x4 x5 achangeright) ))
(forall ((x0 Real) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) )(=> (and (= x0 (- x1 1)) (Neq x2 x0) (LaneSafe x3 x2 adecelerateright) (EgoCar x3 x1 x4 x5) ) (CaseSafeActionDoesNotMatchChangeToLane x3 x2 x1 x4 x5 adecelerateright) ))
(forall ((x0 Real) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) )(=> (and (= x0 (- x1 1)) (Neq x2 x0) (LaneSafe x3 x2 aaccelerateright) (EgoCar x3 x1 x4 x5) ) (CaseSafeActionDoesNotMatchChangeToLane x3 x2 x1 x4 x5 aaccelerateright) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) )(=> (SafeFrontDisproven x0 x1 x2 x3 x4 x5 x6 x7 x8) (SafeDistanceSpeedFrontDisproven x0 x1 x2 x3 x4 x5 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> (- x0 1) x1) (Neq x2 x3) (LaneSafe x4 x3 adecelerateleft) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 adecelerateleft) (SpeedFront x4 x3 x6 x7 adecelerateleft) ) (SafeFrontDisproven x4 x3 x2 x5 x0 adecelerateleft x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> (- x0 1) x1) (Neq x2 x3) (LaneSafe x4 x3 adecelerateright) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 adecelerateright) (SpeedFront x4 x3 x6 x7 adecelerateright) ) (SafeFrontDisproven x4 x3 x2 x5 x0 adecelerateright x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> (+ x0 1) x1) (Neq x2 x3) (LaneSafe x4 x3 aaccelerateleft) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 aaccelerateleft) (SpeedFront x4 x3 x6 x7 aaccelerateleft) ) (SafeFrontDisproven x4 x3 x2 x5 x0 aaccelerateleft x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> (+ x0 1) x1) (Neq x2 x3) (LaneSafe x4 x3 aaccelerateright) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 aaccelerateright) (SpeedFront x4 x3 x6 x7 aaccelerateright) ) (SafeFrontDisproven x4 x3 x2 x5 x0 aaccelerateright x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> x0 x1) (Neq x2 x3) (LaneSafe x4 x3 achangeleft) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 achangeleft) (SpeedFront x4 x3 x6 x7 achangeleft) ) (SafeFrontDisproven x4 x3 x2 x5 x0 achangeleft x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> x0 x1) (Neq x2 x3) (LaneSafe x4 x3 achangeright) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 achangeright) (SpeedFront x4 x3 x6 x7 achangeright) ) (SafeFrontDisproven x4 x3 x2 x5 x0 achangeright x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (= x0 x1) (> (+ x2 1) x3) (> (+ x2 1) x4) (LaneSafe x5 x1 aacceleratestraight) (EgoCar x5 x0 x6 x2) (DistanceFront x5 x1 x7 x3 aacceleratestraight) (SpeedFront x5 x1 x7 x4 aacceleratestraight) ) (SafeFrontDisproven x5 x1 x0 x6 x2 aacceleratestraight x7 x3 x4) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (= x0 x1) (> (- x2 1) x3) (> (- x2 1) x4) (LaneSafe x5 x1 adeceleratestraight) (EgoCar x5 x0 x6 x2) (DistanceFront x5 x1 x7 x3 adeceleratestraight) (SpeedFront x5 x1 x7 x4 adeceleratestraight) ) (SafeFrontDisproven x5 x1 x0 x6 x2 adeceleratestraight x7 x3 x4) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (< x0 x1) (> x1 x2) (= x3 x4) (LaneSafe x5 x4 amovestraight) (EgoCar x5 x3 x6 x1) (DistanceFront x5 x4 x7 x2 amovestraight) (SpeedFront x5 x4 x7 x0 amovestraight) ) (SafeFrontDisproven x5 x4 x3 x6 x1 amovestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) )(=> (SafeBehindDisproven x0 x1 x2 x3 x4 x5 x6 x7 x8) (SafeDistanceSpeedBehindDisproven x0 x1 x2 x3 x4 x5 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) )(=> (and (> x0 x1) (Neq x2 x3) (LaneSafe x4 x3 x5) (EgoCar x4 x2 x6 x7) (DistanceBehind x4 x3 x8 x1 x5) (SpeedBehind x4 x3 x8 x0 x5) ) (SafeBehindDisproven x4 x3 x2 x6 x7 x5 x8 x1 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> x0 x1) (= x2 x3) (< (+ x4 1) x0) (LaneSafe x5 x3 aacceleratestraight) (EgoCar x5 x2 x6 x4) (DistanceBehind x5 x3 x7 x1 aacceleratestraight) (SpeedBehind x5 x3 x7 x0 aacceleratestraight) ) (SafeBehindDisproven x5 x3 x2 x6 x4 aacceleratestraight x7 x1 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> x0 x1) (= x2 x3) (< (- x4 1) x0) (LaneSafe x5 x3 adeceleratestraight) (EgoCar x5 x2 x6 x4) (DistanceBehind x5 x3 x7 x1 adeceleratestraight) (SpeedBehind x5 x3 x7 x0 adeceleratestraight) ) (SafeBehindDisproven x5 x3 x2 x6 x4 adeceleratestraight x7 x1 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> x0 x1) (> x0 x2) (= x3 x4) (LaneSafe x5 x4 amovestraight) (EgoCar x5 x3 x6 x1) (DistanceBehind x5 x4 x7 x2 amovestraight) (SpeedBehind x5 x4 x7 x0 amovestraight) ) (SafeBehindDisproven x5 x4 x3 x6 x1 amovestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Fol) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int) (x11 Int) )(=> (and (CanUseLane x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11) (SuggestedAction x0 x2) (VariantName x0) ) (SuggestionExplained x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int) (x11 Int) )(=> (and (SafeDistanceSpeedBehind x0 x1 x2 x3 x4 x5 x6 x7 x8) (SafeDistanceSpeedFront x0 x1 x2 x3 x4 x5 x9 x10 x11) (ActionMatchesChangeToLane x0 x1 x2 x3 x4 x5) ) (CanUseLane x0 x1 x5 x2 x3 x4 x6 x7 x8 x9 x10 x11) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) )(=> (BehindIsSafe x0 x1 x2 x3 x4 x5 x6 x7 x8) (SafeDistanceSpeedBehind x0 x1 x2 x3 x4 x5 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) )(=> (and (<= x0 x1) (Neq x2 x3) (LaneSafe x4 x3 x5) (EgoCar x4 x2 x6 x7) (DistanceBehind x4 x3 x8 x1 x5) (SpeedBehind x4 x3 x8 x0 x5) ) (BehindIsSafe x4 x3 x2 x6 x7 x5 x8 x1 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (<= x0 (+ x1 1)) (<= x0 x2) (= x3 x4) (LaneSafe x5 x4 aacceleratestraight) (EgoCar x5 x3 x6 x1) (DistanceBehind x5 x4 x7 x2 aacceleratestraight) (SpeedBehind x5 x4 x7 x0 aacceleratestraight) ) (BehindIsSafe x5 x4 x3 x6 x1 aacceleratestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (<= x0 (- x1 1)) (<= x0 x2) (= x3 x4) (LaneSafe x5 x4 adeceleratestraight) (EgoCar x5 x3 x6 x1) (DistanceBehind x5 x4 x7 x2 adeceleratestraight) (SpeedBehind x5 x4 x7 x0 adeceleratestraight) ) (BehindIsSafe x5 x4 x3 x6 x1 adeceleratestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (<= x0 x1) (<= x0 x2) (= x3 x4) (LaneSafe x5 x4 amovestraight) (EgoCar x5 x3 x6 x1) (DistanceBehind x5 x4 x7 x2 amovestraight) (SpeedBehind x5 x4 x7 x0 amovestraight) ) (BehindIsSafe x5 x4 x3 x6 x1 amovestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> x0 (+ x1 1)) (<= 0 x2) (= x3 x4) (LaneSafe x5 x4 aacceleratestraight) (EgoCar x5 x3 x6 x1) (DistanceBehind x5 x4 x7 x2 aacceleratestraight) (SpeedBehind x5 x4 x7 x0 aacceleratestraight) ) (BehindIsSafe x5 x4 x3 x6 x1 aacceleratestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> x0 (- x1 1)) (<= 0 x2) (= x3 x4) (LaneSafe x5 x4 adeceleratestraight) (EgoCar x5 x3 x6 x1) (DistanceBehind x5 x4 x7 x2 adeceleratestraight) (SpeedBehind x5 x4 x7 x0 adeceleratestraight) ) (BehindIsSafe x5 x4 x3 x6 x1 adeceleratestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> x0 x1) (<= 0 x2) (= x3 x4) (LaneSafe x5 x4 amovestraight) (EgoCar x5 x3 x6 x1) (DistanceBehind x5 x4 x7 x2 amovestraight) (SpeedBehind x5 x4 x7 x0 amovestraight) ) (BehindIsSafe x5 x4 x3 x6 x1 amovestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) )(=> (FrontIsSafe x0 x1 x2 x3 x4 x5 x6 x7 x8) (SafeDistanceSpeedFront x0 x1 x2 x3 x4 x5 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (<= (- x0 1) x1) (Neq x2 x3) (LaneSafe x4 x3 adecelerateleft) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 adecelerateleft) (SpeedFront x4 x3 x6 x7 adecelerateleft) ) (FrontIsSafe x4 x3 x2 x5 x0 adecelerateleft x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (<= (- x0 1) x1) (Neq x2 x3) (LaneSafe x4 x3 adecelerateright) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 adecelerateright) (SpeedFront x4 x3 x6 x7 adecelerateright) ) (FrontIsSafe x4 x3 x2 x5 x0 adecelerateright x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (<= (+ x0 1) x1) (Neq x2 x3) (LaneSafe x4 x3 aaccelerateleft) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 aaccelerateleft) (SpeedFront x4 x3 x6 x7 aaccelerateleft) ) (FrontIsSafe x4 x3 x2 x5 x0 aaccelerateleft x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (<= (+ x0 1) x1) (Neq x2 x3) (LaneSafe x4 x3 aaccelerateright) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 aaccelerateright) (SpeedFront x4 x3 x6 x7 aaccelerateright) ) (FrontIsSafe x4 x3 x2 x5 x0 aaccelerateright x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (<= x0 x1) (Neq x2 x3) (LaneSafe x4 x3 achangeleft) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 achangeleft) (SpeedFront x4 x3 x6 x7 achangeleft) ) (FrontIsSafe x4 x3 x2 x5 x0 achangeleft x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (<= x0 x1) (Neq x2 x3) (LaneSafe x4 x3 achangeright) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 achangeright) (SpeedFront x4 x3 x6 x7 achangeright) ) (FrontIsSafe x4 x3 x2 x5 x0 achangeright x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (< x0 (+ x1 1)) (<= (+ x1 1) x2) (= x3 x4) (LaneSafe x5 x4 aacceleratestraight) (EgoCar x5 x3 x6 x1) (DistanceFront x5 x4 x7 x2 aacceleratestraight) (SpeedFront x5 x4 x7 x0 aacceleratestraight) ) (FrontIsSafe x5 x4 x3 x6 x1 aacceleratestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (< x0 (- x1 1)) (<= (- x1 1) x2) (= x3 x4) (LaneSafe x5 x4 adeceleratestraight) (EgoCar x5 x3 x6 x1) (DistanceFront x5 x4 x7 x2 adeceleratestraight) (SpeedFront x5 x4 x7 x0 adeceleratestraight) ) (FrontIsSafe x5 x4 x3 x6 x1 adeceleratestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (< x0 x1) (<= x1 x2) (= x3 x4) (LaneSafe x5 x4 amovestraight) (EgoCar x5 x3 x6 x1) (DistanceFront x5 x4 x7 x2 amovestraight) (SpeedFront x5 x4 x7 x0 amovestraight) ) (FrontIsSafe x5 x4 x3 x6 x1 amovestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (>= x0 (+ x1 1)) (<= 0 x2) (= x3 x4) (LaneSafe x5 x4 aacceleratestraight) (EgoCar x5 x3 x6 x1) (DistanceFront x5 x4 x7 x2 aacceleratestraight) (SpeedFront x5 x4 x7 x0 aacceleratestraight) ) (FrontIsSafe x5 x4 x3 x6 x1 aacceleratestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (>= x0 (- x1 1)) (<= 0 x2) (= x3 x4) (LaneSafe x5 x4 adeceleratestraight) (EgoCar x5 x3 x6 x1) (DistanceFront x5 x4 x7 x2 adeceleratestraight) (SpeedFront x5 x4 x7 x0 adeceleratestraight) ) (FrontIsSafe x5 x4 x3 x6 x1 adeceleratestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (>= x0 x1) (<= 0 x2) (= x3 x4) (LaneSafe x5 x4 amovestraight) (EgoCar x5 x3 x6 x1) (DistanceFront x5 x4 x7 x2 amovestraight) (SpeedFront x5 x4 x7 x0 amovestraight) ) (FrontIsSafe x5 x4 x3 x6 x1 amovestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) )(=> (CaseActionMatchesChangeToLane x0 x1 x2 x3 x4 x5) (ActionMatchesChangeToLane x0 x1 x2 x3 x4 x5) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 x1) (LaneSafe x2 x1 amovestraight) (EgoCar x2 x0 x3 x4) ) (CaseActionMatchesChangeToLane x2 x1 x0 x3 x4 amovestraight) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 x1) (LaneSafe x2 x1 adeceleratestraight) (EgoCar x2 x0 x3 x4) ) (CaseActionMatchesChangeToLane x2 x1 x0 x3 x4 adeceleratestraight) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 x1) (LaneSafe x2 x1 aacceleratestraight) (EgoCar x2 x0 x3 x4) ) (CaseActionMatchesChangeToLane x2 x1 x0 x3 x4 aacceleratestraight) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 (- x1 1)) (LaneSafe x2 x1 achangeleft) (EgoCar x2 x0 x3 x4) ) (CaseActionMatchesChangeToLane x2 x1 x0 x3 x4 achangeleft) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 (- x1 1)) (LaneSafe x2 x1 adecelerateleft) (EgoCar x2 x0 x3 x4) ) (CaseActionMatchesChangeToLane x2 x1 x0 x3 x4 adecelerateleft) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 (- x1 1)) (LaneSafe x2 x1 aaccelerateleft) (EgoCar x2 x0 x3 x4) ) (CaseActionMatchesChangeToLane x2 x1 x0 x3 x4 aaccelerateleft) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 (+ x1 1)) (LaneSafe x2 x1 achangeright) (EgoCar x2 x0 x3 x4) ) (CaseActionMatchesChangeToLane x2 x1 x0 x3 x4 achangeright) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 (+ x1 1)) (LaneSafe x2 x1 adecelerateright) (EgoCar x2 x0 x3 x4) ) (CaseActionMatchesChangeToLane x2 x1 x0 x3 x4 adecelerateright) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 (+ x1 1)) (LaneSafe x2 x1 aaccelerateright) (EgoCar x2 x0 x3 x4) ) (CaseActionMatchesChangeToLane x2 x1 x0 x3 x4 aaccelerateright) ))
(forall ((x0 Int) (x1 Int) (x2 Fol) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) (x9 Int) )(=> (and (CanNotUseLane x0 x1 x2 x3 x4 x5 x6 x7 x8) (LaneNotSafe x0 x9 x2) (VariantName x0) ) (NotSafeExplained x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) ))
(forall ((x0 Int) (x1 Int) (x2 Fol) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) (x9 Int) )(=> (and (CanNotUseLane x0 x1 x2 x3 x4 x5 x6 x7 x8) (LaneNotSafe x0 x9 x2) (VariantName x0) ) (NotSafeExplained x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) ))
(forall ((x0 Int) (x1 Int) (x2 Fol) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) )(=> (CaseCanNotUseLane1 x0 x1 x2 x3 x4 x5 x6 x7 x8) (CanNotUseLane x0 x1 x2 x3 x4 x5 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Fol) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) )(=> (CaseCanNotUseLane2 x0 x1 x2 x3 x4 x5 x6 x7 x8) (CanNotUseLane x0 x1 x2 x3 x4 x5 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Fol) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) )(=> (CaseCanNotUseLane3 x0 x1 x2 x3 x4 x5 x6 x7 x8) (CanNotUseLane x0 x1 x2 x3 x4 x5 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Fol) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) )(=> (CaseCanNotUseLane4 x0 x1 x2 x3 x4 x5 x6 x7 x8) (CanNotUseLane x0 x1 x2 x3 x4 x5 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) )(=> (and (NotSafeDistanceSpeedBehind x0 x1 x2 x3 x4 x5 x6 x7 x8) (NotSafeActionMatchesChangeToLane x0 x1 x2 x3 x4 x5) ) (CaseCanNotUseLane1 x0 x1 x5 x2 x3 x4 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) )(=> (and (NotSafeDistanceSpeedFront x0 x1 x2 x3 x4 x5 x6 x7 x8) (NotSafeActionMatchesChangeToLane x0 x1 x2 x3 x4 x5) ) (CaseCanNotUseLane2 x0 x1 x5 x2 x3 x4 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Fol) (x5 Int) (x6 Int) (x7 Int) (x8 Int) )(=> (and (SpeedLimit x0 x1 x2 x3 x4) (NotSafeActionMatchesChangeToLane x0 x1 x5 x2 x3 x4) (DistanceBehind x0 x1 x6 x7 x4) (SpeedBehind x0 x1 x6 x8 x4) ) (CaseCanNotUseLane3 x0 x1 x4 x5 x2 x3 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Fol) (x5 Int) (x6 Int) (x7 Int) (x8 Int) )(=> (and (SpeedLimit x0 x1 x2 x3 x4) (NotSafeActionMatchesChangeToLane x0 x1 x5 x2 x3 x4) (DistanceFront x0 x1 x6 x7 x4) (SpeedFront x0 x1 x6 x8 x4) ) (CaseCanNotUseLane4 x0 x1 x4 x5 x2 x3 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) )(=> (CaseNotSafeActionMatchesChangeToLane x0 x1 x2 x3 x4 x5) (NotSafeActionMatchesChangeToLane x0 x1 x2 x3 x4 x5) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 x1) (LaneNotSafe x2 x1 amovestraight) (EgoCar x2 x0 x3 x4) ) (CaseNotSafeActionMatchesChangeToLane x2 x1 x0 x3 x4 amovestraight) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 x1) (LaneNotSafe x2 x1 adeceleratestraight) (EgoCar x2 x0 x3 x4) ) (CaseNotSafeActionMatchesChangeToLane x2 x1 x0 x3 x4 adeceleratestraight) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 x1) (LaneNotSafe x2 x1 aacceleratestraight) (EgoCar x2 x0 x3 x4) ) (CaseNotSafeActionMatchesChangeToLane x2 x1 x0 x3 x4 aacceleratestraight) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 (+ x1 1)) (LaneNotSafe x2 x0 achangeleft) (EgoCar x2 x1 x3 x4) ) (CaseNotSafeActionMatchesChangeToLane x2 x0 x1 x3 x4 achangeleft) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 (+ x1 1)) (LaneNotSafe x2 x0 adecelerateleft) (EgoCar x2 x1 x3 x4) ) (CaseNotSafeActionMatchesChangeToLane x2 x0 x1 x3 x4 adecelerateleft) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 (+ x1 1)) (LaneNotSafe x2 x0 aaccelerateleft) (EgoCar x2 x1 x3 x4) ) (CaseNotSafeActionMatchesChangeToLane x2 x0 x1 x3 x4 aaccelerateleft) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 (- x1 1)) (LaneNotSafe x2 x0 achangeright) (EgoCar x2 x1 x3 x4) ) (CaseNotSafeActionMatchesChangeToLane x2 x0 x1 x3 x4 achangeright) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 (- x1 1)) (LaneNotSafe x2 x0 adecelerateright) (EgoCar x2 x1 x3 x4) ) (CaseNotSafeActionMatchesChangeToLane x2 x0 x1 x3 x4 adecelerateright) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) )(=> (and (= x0 (- x1 1)) (LaneNotSafe x2 x0 aaccelerateright) (EgoCar x2 x1 x3 x4) ) (CaseNotSafeActionMatchesChangeToLane x2 x0 x1 x3 x4 aaccelerateright) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) )(=> (NotSafeBehind x0 x1 x2 x3 x4 x5 x6 x7 x8) (NotSafeDistanceSpeedBehind x0 x1 x2 x3 x4 x5 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) )(=> (and (> x0 x1) (Neq x2 x3) (LaneNotSafe x4 x3 x5) (EgoCar x4 x2 x6 x7) (DistanceBehind x4 x3 x8 x1 x5) (SpeedBehind x4 x3 x8 x0 x5) ) (NotSafeBehind x4 x3 x2 x6 x7 x5 x8 x1 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> x0 (+ x1 1)) (> x0 x2) (= x3 x4) (LaneNotSafe x5 x4 aacceleratestraight) (EgoCar x5 x3 x6 x1) (DistanceBehind x5 x4 x7 x2 aacceleratestraight) (SpeedBehind x5 x4 x7 x0 aacceleratestraight) ) (NotSafeBehind x5 x4 x3 x6 x1 aacceleratestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> x0 (- x1 1)) (> x0 x2) (= x3 x4) (LaneNotSafe x5 x4 adeceleratestraight) (EgoCar x5 x3 x6 x1) (DistanceBehind x5 x4 x7 x2 adeceleratestraight) (SpeedBehind x5 x4 x7 x0 adeceleratestraight) ) (NotSafeBehind x5 x4 x3 x6 x1 adeceleratestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> x0 x1) (> x0 x2) (= x3 x4) (LaneNotSafe x5 x4 amovestraight) (EgoCar x5 x3 x6 x1) (DistanceBehind x5 x4 x7 x2 amovestraight) (SpeedBehind x5 x4 x7 x0 amovestraight) ) (NotSafeBehind x5 x4 x3 x6 x1 amovestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) )(=> (NotSafeFront x0 x1 x2 x3 x4 x5 x6 x7 x8) (NotSafeDistanceSpeedFront x0 x1 x2 x3 x4 x5 x6 x7 x8) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> (- x0 1) x1) (Neq x2 x3) (LaneNotSafe x4 x3 adecelerateleft) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 adecelerateleft) (SpeedFront x4 x3 x6 x7 adecelerateleft) ) (NotSafeFront x4 x3 x2 x5 x0 adecelerateleft x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> (- x0 1) x1) (Neq x2 x3) (LaneNotSafe x4 x3 adecelerateright) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 adecelerateright) (SpeedFront x4 x3 x6 x7 adecelerateright) ) (NotSafeFront x4 x3 x2 x5 x0 adecelerateright x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> (+ x0 1) x1) (Neq x2 x3) (LaneNotSafe x4 x3 aaccelerateleft) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 aaccelerateleft) (SpeedFront x4 x3 x6 x7 aaccelerateleft) ) (NotSafeFront x4 x3 x2 x5 x0 aaccelerateleft x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> (+ x0 1) x1) (Neq x2 x3) (LaneNotSafe x4 x3 aaccelerateright) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 aaccelerateright) (SpeedFront x4 x3 x6 x7 aaccelerateright) ) (NotSafeFront x4 x3 x2 x5 x0 aaccelerateright x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> x0 x1) (Neq x2 x3) (LaneNotSafe x4 x3 achangeleft) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 achangeleft) (SpeedFront x4 x3 x6 x7 achangeleft) ) (NotSafeFront x4 x3 x2 x5 x0 achangeleft x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (> x0 x1) (Neq x2 x3) (LaneNotSafe x4 x3 achangeright) (EgoCar x4 x2 x5 x0) (DistanceFront x4 x3 x6 x1 achangeright) (SpeedFront x4 x3 x6 x7 achangeright) ) (NotSafeFront x4 x3 x2 x5 x0 achangeright x6 x1 x7) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (< x0 (+ x1 1)) (> (+ x1 1) x2) (= x3 x4) (LaneNotSafe x5 x4 aacceleratestraight) (EgoCar x5 x3 x6 x1) (DistanceFront x5 x4 x7 x2 aacceleratestraight) (SpeedFront x5 x4 x7 x0 aacceleratestraight) ) (NotSafeFront x5 x4 x3 x6 x1 aacceleratestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (< x0 (- x1 1)) (> (- x1 1) x2) (= x3 x4) (LaneNotSafe x5 x4 adeceleratestraight) (EgoCar x5 x3 x6 x1) (DistanceFront x5 x4 x7 x2 adeceleratestraight) (SpeedFront x5 x4 x7 x0 adeceleratestraight) ) (NotSafeFront x5 x4 x3 x6 x1 adeceleratestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) )(=> (and (< x0 x1) (> x1 x2) (= x3 x4) (LaneNotSafe x5 x4 amovestraight) (EgoCar x5 x3 x6 x1) (DistanceFront x5 x4 x7 x2 amovestraight) (SpeedFront x5 x4 x7 x0 amovestraight) ) (NotSafeFront x5 x4 x3 x6 x1 amovestraight x7 x2 x0) ))
(forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Fol) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int) (x11 Int) )(=> (SelfSuggestionDisproven x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11) (ResultDeg x0 x1 x2 x3 x4 x6 x7 x8 x9 x10 x11 x5) ))
(forall ((x0 Int) (x1 Int) (x2 Fol) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int) (x11 Int) )(=> (SuggestionExplained x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11) (ResultDeg x0 x1 x3 x4 x5 x6 x7 x8 x9 x10 x11 x2) ))
(forall ((x0 Real) (x1 Real) )(=> (< x0 x1) (Neq x0 x1) ))
(forall ((x0 Real) (x1 Real) )(=> (> x0 x1) (Neq x0 x1) ))
(=> (> 0 GC0) false)
(=> (> GC0 1) false)
(=> (> 0 GC1) false)
(=> (> GC1 2) false)
(=> (> 0 GC2) false)
(=> (> GC2 2) false)
(=> (> 0 GC3) false)
(=> (> GC3 0) false)
(=> (> 0 GC4) false)
(=> (> GC4 5) false)
(=> (> 0 GC5) false)
(=> (> GC5 0) false)
(=> (> 0 GC6) false)
(=> (> GC6 5) false)
(=> (> 0 GC7) false)
(=> (> GC7 5) false)
(=> (> 0 GC8) false)
(=> (> GC8 0) false)
(=> (> 0 GC9) false)
(=> (> GC9 5) false)
(=> (> 0 GC10) false)
(=> (> GC10 5) false)
(=> (ResultDeg GC0 GC1 GC2 GC3 GC4 GC5 GC6 GC7 GC8 GC9 GC10 GC11) false)
))
(assert (forall ((x Fol)) (or (= x amovestraight) (= x achangeleft) (= x achangeright) (= x adeceleratestraight) (= x adecelerateleft) (= x adecelerateright) (= x aacceleratestraight) (= x aaccelerateleft) (= x aaccelerateright) )))
(check-sat)
(exit)