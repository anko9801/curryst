#import "../curryst.typ" : rule, prooftree, br
#set document(date: none)
#set page(margin: 0.5cm, width: auto, height: auto)

#let test(width: auto, config: (:), ..args) = {
  for dir in (btt, ttb) {
    pagebreak(weak: true)
    block(
      stroke: 0.3pt + red,
      width: width,
      prooftree(dir: dir, rule(..args), ..config)
    )
  }
}


#test(
  [Conclusion],
)


#test(
  name: [Axiom],
  [Conclusion],
)


#test(
  label: [Label],
  name: [Axiom],
  [Conclusion],
)


#test(
  label: [Label],
  name: [Name],
  [Long conclusion],
  [Premise],
)


#test(
  label: [Label],
  name: [Name],
  [Conclusion],
  [Long premise],
)


#test(
  label: [Label],
  name: [Name],
  [Conclusion],
  [Premise 1],
  [Premise 2],
)


#test(
  label: [Label],
  name: [Name],
  [Very long conclusion],
  [Prem. 1],
  [Prem. 2],
)


#test(
  label: [Label],
  name: [Name],
  [Very long conclusion],
  rule(
    [Prem. 1],
    [Hypothesis 1],
  ),
  [Prem. 2],
)


#test(
  label: [Label],
  name: [Name],
  [Very long conclusion],
  rule(
    label: [Other label],
    name: [Other name],
    [Prem. 1],
    [Hypothesis 1],
  ),
  [Prem. 2],
)


#test(
  name: [Name],
  [Very long conclusion],
  rule(
    [Prem. 1],
    [Hypothesis 1],
  ),
  rule(
    name: [Other name],
    [Prem. 2],
    [Hypothesis 2],
  ),
)


#let ax(ccl) = rule(name: [ax], ccl)
#let and-el(ccl, p) = rule(name: $and_e^l$, ccl, p)
#let and-er(ccl, p) = rule(name: $and_e^r$, ccl, p)
#let impl-i(ccl, p) = rule(name: $attach(->, br: i)$, ccl, p)
#let impl-e(ccl, pi, p1) = rule(name: $attach(->, br: e)$, ccl, pi, p1)
#let not-i(ccl, p) = rule(name: $not_i$, ccl, p)
#let not-e(ccl, pf, pt) = rule(name: $not_e$, ccl, pf, pt)

#test(
  [Conclusion],
  impl-i(
    $tack (p -> q) -> not (p and not q)$,
    not-i(
      $p -> q tack  not (p and not q)$,
      not-e(
        $p -> q, p and not q tack bot$,
        impl-e(
          $Gamma tack q$,
          ax($Gamma tack p -> q$),
          and-el(
            $Gamma tack p$,
            ax($Gamma tack p and not q$),
          ),
        ),
        and-er(
          $Gamma tack not q$,
          ax($Gamma tack p and not q$),
        ),
      ),
    ),
  ),
)


#test(
  [This is a very wide conclusion, wider than all premises combined],
  [Premise],
  [Premise],
  [Premise],
)

#test(
  [Conclusion],
  rule(
    [Premise],
    [Short],
  ),
  rule(
    [Premise],
    [Short],
  ),
  rule(
    [Premise],
    [Very long premise to a premise in a tree],
  ),
)

#test(
  [Conclusion],
  rule(
    [Premise],
    [Very long premise to a premise in a tree],
  ),
  rule(
    [Premise],
    [Short],
  ),
  rule(
    [Premise],
    [Short],
  ),
)


#let ax(ccl) = rule(name: "aaaaaaaa", ccl)
#let and-el(ccl, p) = rule(name: "aaaaaaaaaaaaaaaaaaaaaaaa", ccl, p)
#let and-er(ccl, p) = rule(name: "aaaaaaaa", ccl, p)
#let impl-i(ccl, p) = rule(name: "aaaaaaaa", ccl, p)
#let impl-e(ccl, pi, p1) = rule(name: "aaaaaaaaaaaaaaaaa", ccl, pi, p1)
#let not-i(ccl, p) = rule(name: "aaaaaaaa", ccl, p)
#let not-e(ccl, pf, pt) = rule(name: "aaaaaaaa", ccl, pf, pt)

#test(
  config: (min-premise-spacing: 8pt),
  [Conclusion],
  impl-i(
    $tack (p -> q) -> not (p and not q)$,
    not-i(
      $p -> q tack  not (p and not q)$,
      not-e(
        $p -> q, p and not q tack bot$,
        impl-e(
          $Gamma tack q$,
          ax($Gamma tack p -> q$),
          and-el(
            $Gamma tack p$,
            ax($Gamma tack p and not q$),
          ),
        ),
        and-er(
          $Gamma tack not q$,
          ax($Gamma tack p and not q$),
        ),
      ),
    ),
  ),
)


#test(
  config: (stroke: stroke(paint: blue, thickness: 2pt, cap: "round", dash: "dashed")),
  name: [Name],
  [Conclusion],
  [Premise],
)


#test(
  config: (
    min-premise-spacing: 2cm,
    title-inset: 1cm,
    vertical-spacing: 0.2cm,
    min-bar-height: 0.3cm,
  ),
  name: [Name],
  [Conclusion],
  rule(
    label: [Label 1],
    [Premise 1],
    [Hypothesis 1],
  ),
  rule(
    name: [Name 2],
    [Premise 2],
    [Hypothesis 2],
  ),
  rule(
    label: [Label 3],
    name: [Name 3],
    [Premise 3],
    [Hypothesis 3],
  ),
)


#test(
  config: (
    min-premise-spacing: 0pt,
    title-inset: 0pt,
    vertical-spacing: 0pt,
    min-bar-height: 0pt,
  ),
  name: [Name],
  [Conclusion],
  rule(
    label: [Label 1],
    [Premise 1],
    [Hypothesis 1],
  ),
  rule(
    name: [Name 2],
    [Premise 2],
    [Hypothesis 2],
  ),
  rule(
    label: [Label 3],
    name: [Name 3],
    [Premise 3],
    [Hypothesis 3],
  ),
)

#test(
  name: [T-LET],
  [$Sigma;Gamma tack "let" x=t "in" t_"body" : sigma_"body"$], 
  [$Delta;Sigma tack t:sigma$], [$not exists tau^prime. Gamma(x)=tau^prime$], br,
  [$Gamma;Sigma,(x:sigma) tack t_"body":sigma_"body"$],
)

// Test leafs are shown on multiple lines when appropriate.

#test(
  width: 5cm,
  name: $or_e$,
  $Gamma tack psi$,
  $Gamma tack phi_1 or phi_2$,
  $Gamma, phi_1 tack psi$,
  $Gamma, phi_2 tack psi$,
)

#test(
  width: 5cm,
  config: (
    min-premise-spacing: 1cm
  ),
  [The conclusion],
  rect(width: 1cm),
  rect(width: 1cm),
  rect(width: 1cm),
)

#test(
  width: 5cm,
  config: (
    min-premise-spacing: 1cm
  ),
  [The conclusion is a bit wide],
  rect(width: 1cm),
  rect(width: 1cm),
  rect(width: 1cm),
)

#test(
  width: 5cm,
  config: (
    min-premise-spacing: 1cm
  ),
  [The conclusion is hugely wide!!!],
  rect(width: 1cm),
  rect(width: 1cm),
  rect(width: 1cm),
)

#test(
  width: 5cm,
  config: (
    min-premise-spacing: 1cm,
    title-inset: 0pt,
  ),
  [The conclusion],
  rect(width: 1cm),
  rect(width: 1cm),
  rect(width: 1cm),
)

#test(
  width: 8cm,
  config: (
    min-premise-spacing: 1cm,
    title-inset: 0.5cm,
  ),
  name: rect(width: 0.5cm),
  label: rect(width: 0.5cm),
  [The conclusion],
  rect(width: 1cm),
  rect(width: 1cm),
  rect(width: 1cm),
)

#test(
  width: 7.9cm,
  config: (
    min-premise-spacing: 1cm,
    title-inset: 0.5cm,
  ),
  name: rect(width: 0.5cm),
  label: rect(width: 0.5cm),
  [The conclusion],
  rect(width: 1cm),
  rect(width: 1cm),
  rect(width: 1cm),
)

#{
  // This test triggers a very specific issue. I can't find a way to reproduce
  // it without using Libertinus Serif as the font.
  // The issue is that rules are incorrectly laid out vertically due to rounding
  // errors. Note that, for this test to work, the container in the `test`
  // function should be a `block` and not a `box`.
  set text(font: "Libertinus Serif")
  test(
    name: [......................],
    [...],
    [................],
    [................],
  )
}


#test(
  [This is a very wide conclusion, wider than all premises combined],
  [Premise],
  [Another premise.],
)

#test(
  [This is a very wide conclusion, wider than all premises combined],
  rule(
    [Premise],
    [Very, very wide hypothesis...]
  ),
  [Another premise.],
)

#test(
  [This is a very wide conclusion, wider than all premises combined],
  rule(
    [Premise],
    [Hyyyyyyyyyyyyyyyyyyypothesis]
  ),
  rule(
    [Premise],
    [Hyyyyyyyyyyyyyyyyyyypothesis as well]
  ),
)


#test(
  [This is a wide conclusion, but not the widest],
  rule(
    [Premise],
    [Hyyyyyyyyyyyyyyyyyyypothesis]
  ),
  rule(
    [Premise],
    [Hyyyyyyyyyyyyyyyyyyypothesis as well]
  ),
)
