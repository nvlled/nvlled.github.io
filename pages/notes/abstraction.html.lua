PAGE_TITLE = "Abstraction";
PAGE_DATE = "2023-02-07 20:21"

function CreateFootNote()
    local i = 0
    local self
    self = {
        c = function(s)
            table.insert(self.entries, s)
            i = i + 1
            return A { href = "#footnote-" .. tostring(i), "[" .. tostring(i) .. "]" }
        end,
        entries = {},
    }
    return self
end

local footnote = CreateFootNote()

return LAYOUT {
    PP [[Whenever the topic of abstraction comes up, it's not uncommon for people
    to have very strong, polaziring opinions on the topic. It's not uncommon
    for someone to interject and say how you shouldn't do this or that, and
    then without fail that person proceeds to recite wisdom of the
    fore-elders, how wet yagnis are silver slice bread of the future.

    Okay, I'm exaggerating it, but I'm not just beating hays here. There are
    actual growing number of people who believes that abstraction is purely
    just a tool for drying the wet code ]]
    / footnote.c [[For anyone unfamiliar with these terms, DRY stands for Don't Repeat Yourself, WET for Write Everything Twice.]]
    / [[, and on a pathological case, they would describe anything, even mildly,
    related to abstractions as "overengineering", or "job security".]],

    PP [[But first things first, what do I mean abstraction here? To abstract means
    to set aside irrelevant details and focus only on the essentials.
    Abstraction is a means to hide details and reduce complexity for the
    problem in hand]] / footnote.c "This is probably a inadequate definition, feel free to look up a proper definition to help."
    / [[. This is quite a general definition, but in terms of programming,
    abstraction includes DSLs, macros, type definitions, and functions]]
    / footnote.c [[Yes, even functions. I've seen people object to the idea that functions are abstractions.
    But functions do fit the definition of abstraction, at least with the definition I'm using here.]],

    PP [[
    Now, just to be clear, I'm not claiming abstractions are universally
    better and that it should be used everywhere. I'm not trying to choose a
    side between the wet and dry camp, or which is better. I'm specifically
    addressing the mistaken idea that abstraction is _only_ for deduplicating
    code.

    This bears repeating and worth belaboring: Reducing duplication isn't the
    only purpose of abstraction.

    Yes, abstraction can be used to avoid duplication, but it's not the only
    purpose of abstraction. Also, just with everything, abstraction can be
    overdone that results in untamable gargantuan behemoth. It doesn't mean it
    should not be used, or should be avoided. If done right, abstractions can
    tremendously simplify code, and help reason with logic.

    If you are in agreement with everything I just said, you can stop reading
    now, the world will be just as it was. I'm not even claiming anything
    outlandish here, what I said is something that should go without saying.

    Alas, this is not the case. Unfortunate as it is, there are the
    extremists, and there are the indocrinated, who will proudly condemn the
    purpose of abstractions, some of those are influential people that seeks
    to that disrupt the cosmic balance that will tear apart the fabric of
    reality.

    What am I talking about again? Oh yeah, abstractions. ]],

    HR,

    PP [[

    I'm going to keep this short. I will discuss one code example, a silly one
    at that, and show how abstractions could help simplify them.

    Try to read the following code.
    ]],

    PRE { class = "code" } / CODE [[
function colonizeSolarSystem(ss: SolarSystem) {
  for (const body of ss.celestialBodies) {
    if (
      body.size < theFuckItsHuGEE ||
      body.shape != "spherical" ||
      body.temperature < ashesToCinders ||
      body.lifeForms.length == 0
    ) {
      continue;
    }

    const sumIntel = 0;
    const viableLifeForms = [];
    for (const creature of body.lifeForms) {
      if (
        creature.consciousness > 0 &&
        creature.intelligence > cockcroach.intelligence &&
        creature.size > 10 * bananas.size
      ) {
        viableLifeForms.push(creature);
        sumIntel += creature.intelligence;
      }
    }

    if (viableLifeForms.length < villagePopulationSize) {
      continue;
    }

    const averageIntel = sumIntel / viableLifeForms.length;
    const leader = null;
    for (const creature of body.viableLifeForms) {
      if (
        creature.charisma >= goat &&
        closeTo(create.intelligence, averageIntel)
      ) {
        leader = creature;
        break;
      }
    }

    if (!leader) {
      continue;
    }

    const homePos = leader.position;
    spacecraft.position = leader.position;
    spacecraft.emitAbductionRays(leader);
    spacecraft.position = outerspace;

    delete leader.memories;
    for (const neuron of leader.brain) {
      neuron.cells = alienWorms;
    }

    leader.position = homePos;
    spacecraft.dropLoad(leader);
  }
}
    ]],

    PP [[
    Even if you aren't into planetary invasion, you might at least agree that the function \`colonizeSolarSystem\` could
    use a little work. Or maybe you believe in WET code, that think it's fine
    as it is, because not a duplicated code is in sight. And that's fine too.
    But if you are open-minded, and are willing to peek on the other side,
    consider how a simple abstraction (just functions in this case) could help
    with readability: ]],
    PRE { class = "code" } / CODE [[
function isPlanet(body: CelestialBody) {
  return (
    body.size >= theFuckItsHuGEE &&
    body.shape == "spherical" &&
    body.temperature >= ashesToCinders
  );
}

function isComplexLife(creature: LifeForm) {
  return (
    creature.consciousness > 0 &&
    creature.intelligence > cockcroach.intelligence &&
    creature.size > 10 * bananas.size
  );
}

function scanViableLifeForms(body: CelestialBody) {
  const viableLifeForms = [];
  for (const creature of body.lifeForms) {
    if (isComplexLife(creature)) {
      viableLifeForms.push(creature);
    }
  }
  return viableLifeForms;
}

function getAverageIntelligence(creatures: LifeForm[]) {
  const sum = creatures.map((c) => c.intelligence).reduce((a, b) => a + b);
  return sum / creatures.length;
}

function findPotentialOverlord(creatures: LifeForm[]) {
  const averageIntel = getAverageIntelligence(viableLifeForms);
  for (const creature of creatures) {
    if (
      creature.charisma >= goat &&
      closeTo(creature.intelligence, averageIntel)
    ) {
      return creature;
    }
  }
  return null;
}

function abductCreature(creature: LifeForm) {
  spacecraft.position = creature.position;
  spacecraft.emitAbductionRays(creature);
  spacecraft.position = outerspace;
}

function eatBrains(creature: LifeForm) {
  delete creature.memories;
  for (const neuron of creature.brain) {
    neuron.cells = alienWorms;
  }
}

function returnCreature(creature: LifeForm, homePos: Position) {
  creature.position = homePos;
  spacecraft.dropLoad(creature);
}

function colonizeSolarSystem(ss: SolarSystem) {
  for (const body of ss.celestialBodies) {
    if (!isPlanet(body) || body.lifeForms.length == 0) {
      continue;
    }

    const viableLifeForms = scanViableLifeForms(body);
    const leader = findPotentialOverlord(viableLifeForms);

    if (leader && viableLifeForms.length >= villagePopulationSize) {
      const homePos = creature.position;
      abductCreature(leader);
      eatBrains(leader);
      returnCreature(leader, homePos);
    }
  }
}

  ]],

    PP [[
    There, \`colonizeSolarSystem\` is now concise, and it's now easier at a
    glance to see the machinations that unfold and the doom that awaits us
    all!!1

    Or not. You could say it's now harder to read because it hides all the
    details, and now you have to jump places to read the code. Indeed, and
    that is the point of abstraction: To reason at a higher level and to
    declutter the mind from the burden of non-essential details.

    We can agree to disagree which version is better. Or maybe you are
    somewhere in the middle, that you think one or two helper functions would
    suffice. That's cool too. Personally, the actual code I write varies
    between hardly abstracted, to moderately abstracted, to heavily abstracted
    ones. It really depends on what kind of problems I have and what solutions
    I have in mind, and the amount of effort I'm willing to expend on a
    particular case.

    I'm not prescribing which approach is universally better, if there is even
    one. But, at the very least, the next time you see a code that liberally
    uses abstractions, consider first the reasoning and the preferences that
    went into writing that code first. It doesn't mean you aren't allowed to
    constructively criticize it. Just don't do it sub-conciously while
    chanting wet yagnis.

    If despite the points I've made, you are going to still protest that those
    functions are only ever going to be used once, why even bother defining
    them, then I failed to convey my points clearly, or you still are beholden
    to the teachings you hold dearly. ]],

    HR,

    PP [[
    Okay, maybe now you see abstractions in a different light. Maybe you start
    to ponder the best soil moisture density where your would cultivate your
    coding projects. Is this too wet or too dry? Instead of being dismissive
    about it, you are now actually putting some thoughts when to use
    abstractions and how to use them properly. Well, at least I hope that is
    what on your mind.

    Here's the thing though: if you still recite these acronyms (DRY, AHA,
    YAGNI, WET, SPOT, KISS, AHAHA
    {footnote.c("Not an acronym, I'm just laughing maniacally AHAHA")}) while
    in your decision-making process, it's almost quite likely that you still
    haven't internalized properly what abstractions are for.

    Recall how I defined abstractions: to reduce complexity or simplify code
    by means of hiding irrelevant details under a name or idea. In
    programming, one way to hide details is through functions. You can also
    think of it as a way of extending your domain or programming language's
    vocabulary. Note how duplication is completely absent from this
    definition. Although both abstraction and DRY'ing involves putting code
    behind a common name, the intent is very different. DRY/WET is tangent to
    the process of making an abstraction. That is to say, if you are creating
    a function/class for the sole purpose removing duplicated code, you are by
    definition not creating an abstraction.
    ]],

    P [[
    Some of you now may be getting all fidgety in your seats, hands all
    sweaty, raised and shaking: "B-but abstraction is reducing duplicated
    code! It says so in the 10 year-old ]] / A { href = "https://en.wikipedia.org/wiki/Abstraction_principle_%28computer_programming%29", "old wikipedia page" } / [[":]],

    PRE [[
| In software engineering and programming language theory, the abstraction
| principle (or the principle of abstraction) is a basic dictum that aims to
| reduce duplication of information in a program (usually with emphasis on
| code duplication) whenever practical by making use of abstractions
| provided by the programming language or software libraries[citation needed]
    ]],
    PP [[

    I agree, and it's unfortunate. The wiki and other sources painted only one
    side of the abstraction and has become authorative. Descriptivism wins
    this round! The ship has long sailed. There's is no correcting it because
    it is already the correct definition. The worse part is that people are
    now most likely unaware of the original, alternative definition.

    What does it mean for us? What actionable ideas is there to partake with?
    It means that abstraction has two orthogonal meanings: one that means
    deduplication, and the other that means suppression of details. They are
    very different concepts that coincidentally just uses the same word.

    The important thing to remember is to be aware which kind of "abstraction"
    are you using. Although code deduplication is a valid use case, you likely
    want to be using the other kind of abstraction for most of the time, if
    ever you need to create an abstraction.

    Deduplication is easier since it's all mechanically moving code around,
    e.g., refactoring. It's harder to create abstractions that simplifies code
    or enables more complex expressions. Yes, it's harder, but don't let it
    stop you from trying. Even simple abstractions in the
    \`colonizeSolarSystem\` goes a long way.

  ]],

    HR,

    PP [[
    Okay, by now you feel like you have reached a higher state of being, and
    that you now understand the true meaning of abstraction. You are ready to
    spread the good message to the unwashed mortals that still abstract merely
    to foil duplicities.

    But then, someone rings your doorbell and you opened the door to a person
    who without solicitation uttered "duplication is far cheaper than wrong
    abstraction". Upon hearing the words, the pillars that held your nirvana
    fell apart, and your higher state of being crumbled to a formless wreck
    that spiraled towards very depths of insignificance.

    If abstractions requires more thought, and costs more when done wrong,
    then duplications must be the default and preferred way of programming,
    and abstraction should be avoided if possible.

    Once again, if catchphrases and sound bites are enough to invalidate any
    convictions you have, you haven't really gone far much from chanting
    acronyms. Focus on the essentials, discard the irrelevant, and the true
    form reveals itself. Ask yourself: is this statement true? "duplication is
    far cheaper than wrong abstraction" How true is it, when is it true?

    Here's my take on this.

    Contrary to what people say, zero abstractions isn't necessarily simpler
    to read, write, or refactor. Shit code is shit code, whether it's
    completely DRY and exhausted of reason and harmony, or WET and flooded
    with repeated, eternal pain and suffering. You could argue that it's
    easier to change code with no abstractions, I could argue the same thing,
    but in reverse. You could argue that it's more costly to create wrong
    abstractions. I agree, but again this only applies to extreme, degenerate
    cases, where the wrong abstraction has been deeply entrenched in the
    codebase. You can't objectively say that it was because of abstraction,
    without first demonstrating that the other extreme case is any better,
    where there are little to no abstractions are used, and duplications are
    everywhere.

    When someone says duplication is cheaper than wrong abstraction, it is
    most definitely because that mild to moderate duplication is being
    compared to a complex abstraction. It's not fair to compare cases of
    different severity. If I want argue for the other end, I would compare a
    simple abstraction to a pathological case where a code block is repeated a
    thousand times in different places each with minor variations, to which
    then I claim that abstraction is far cheaper than excessively duplicated
    code.

    But case in point, abstractions do have runtime costs. Even functions add
    overhead. But unless you are working on a really restricted environment,
    it doesn't matter for most of the time. Plus, compilers are good at
    optimizing abstractions for free. Gargantuan abstractions that evolve into
    libraries or frameworks may add significant cost, but it's disingenous to
    use that as a point of contention when topic is about choosing duplication
    over abstraction. Meaning, it's besides the point and not relevant.

    Despite my leanings towards better abstractions, I do see where the
    anti-abstraction sentiment is coming from. There was an era where pure OOP
    and design patterns dominated the software industry. On one hand, I think
    having strong convictions/opinions about something is good, as it pushes
    ideas beyond the border, where new ideas are improved or discovered. On
    the other hand, if there is lack of competition or contention, the
    unchallenged ideas gets pushed too far into dogmatic, authoritarian
    territory. I think the anti-abstraction crowd did well to move the
    industry from the era of bloated abstractions, but let us not push too far
    ahead, lest we fall past over the edge.

    The key takeaways are:

  ]],

    UL {
        LI "abstractions are not just for de-duplicating code",
        LI "use acronyms as a mnemonic, not as a substitute for thoughtful reasoning and judgment",
        LI "use abstractions if they could help reduce the complexity",
        LI "the aliens are coming for us",
        LI "TANSTAAFL, abstraction has a cost, so is the absence of it",
    },

    H2 "Footnotes",

    OL(
        ext.map(footnote.entries, function(s, id)
            return LI { id = "footnote-" .. (id or ""), s }
        end)
    )
}
