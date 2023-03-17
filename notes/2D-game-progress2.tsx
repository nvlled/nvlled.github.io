import { PageData, PageRender } from "cita";
import { Layout, Markdown, PostLayout } from "components";

export const data: PageData = {
  title: "2D game progress #2",
  created: "2023-03-16 19:44:38",
};

export const render: PageRender = () => {
  return <PostLayout data={data}>
    <img src="assets/notes/dgen-2.gif" />

    <Markdown text={`
    It's that time of the week again where I ask myself
    what am I even doing with my life. Or should I say,
    yay, I've done something. I don't what it is, but it's
    something. An abomination perhaps. No, it's a goblin
    wreaking havoc with bananas. Also, if you squint a little
    bit, you would notice that the smoke-fire effect is actually
    a bunch of frogs.

    As the gif above illustrates, I've managed to 
    create interactive houses that takes damage upon hit.
    This may seem like a piss-easy task, but 
    to be honest it was mildly frustrating trying to 
    get the even bare minimum working, which 
    involves lots of trial and error, and frequent
    documentation lookups, and occasionally watching
    some old video tutorials.

    This isn't a criticism of godot ecosystem though.
    This is more of my impatience to get something 
    up and working as soon as possible before I lose interest.
    As with any framework or game engine, learning godot
    takes some effort to learn how to use effectively.
    Sometimes I think, this seems to be too complex,
    maybe more than it needs to be, and then I yearn for the simplicity of Ebiten's API.

    But no, all this complexity is necessary I think.
    The initial investment to learn the godot editor and API might be
    large, but I'd like to believe the payoff in
    terms of productivity is worth it in the end,
    where it becomes easier from then on.

    Indeed, I thought it was fun after seeing the result:
    destroying houses by slinging bananas at them.
    If that was fun, wait until I get to sling cows at the
    villagers who are stealing the poor goblin's crops.

    If I were try to reflect why the impatience, it's because
    my job search isn't going well, and at this point I might
    just as well give up, and just go for the entrepreneurial route.
    I don't have anything to lose if I keep trying though, so yeah, I will
    stick to the plan of applying for jobs while learning gamedev.
    I still doubt myself though if learning a game engince would be the best
    economical use of my time, compared to say, learning how to write compilers
    or reading a computer science book.

    Still, there's nothing worse than not sticking to any commitments I've made,
    and not getting anything done at all. I've already started with Godot,
    I might as well stick to it until I've made something.

    That all said, as usual I will list the difficulties and challenges I had, 
    no matter minor or trivial they were.

    ## Tilemap creation

    This one was particularly difficult. I spent almost a day trying to
    look for tilesets in [opengameart](https://opengameart.org) and
    create a map that wasn't painful to look at. My terrible zero
    artistic sense aside, the inconsistent tileset that I had to mishmash together
    made it impossible to create a consistent, non-ugly ass map. No offense to the
    LPC art collection from opengameart, the art looks okay for the most part,
    the fault is entirely in my own ability.

    And with that, I just inverted my goal to making a game that was as hideous as possible,
    so hideous that it's too funny to hate it. That way, I could focus on my efforts
    on learning how to use Godot and not worry about the monstrosities that I spawn
    along my journey to become a shitty gamedev. 

    ## Particles
    Creating particles was one of the least intuitive things I've encountered
    so far with Godot. And I don't mean just the documentation, but setting the image
    to use the particle was all over the place, I literally had to scroll up
    and down numerous times wondering how would I use a spritesheet for it.
    I had to follow a [video tutorial](https://www.youtube.com/watch?v=PMZ7yBwleik) 
    to figure it out. Also, I don't get why that video was so much in a rush to make
    a tutorial less than 2 minutes.  Make it at least five minutes,
    what's this, a speedrun? But, I'm being an ungrateful prick again, so anyways,
    thanks random dude on the internet.

    Initially only used a frog spritesheet for testing, but it actually looks
    just fine as a fire smoke particle from a distance.
    ![](/assets/notes/dgen-3.gif)

    ## Collision detection
    The banana collides with the house just fine, but how to I "listen"
    for that event? I tried 2 approaches, one with polling for
    \`GetCollidingBodies\` inside \`_PhysicsFrame()\`, and the other by
    listening to the event \`BodyEntered\`. Both didn't didn't work until
    I actually had to enable *Contact Monitor*, something I read before
    but forgot.
    `} />
  </PostLayout>;
};