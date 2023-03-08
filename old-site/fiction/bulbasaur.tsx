import { PageData, PageRender } from "cita";
import { pageDir } from "../../gen_sitemap.ts";
import { Layout, MainNav } from "../layout.tsx";

export const data: PageData = {
  title: "Bulbasaur is dumb",
  created: "2017-03-21 00:00:00",
};

export const render: PageRender = () => {
  return (
    <Layout title={data.title}>
      <div>
        <h2>Bulbasaur is a dumb animal</h2>
        <hr />
        <p class="note">
          Before any devoted bulbasaur fan or monster rights activist decides to
          hunt me down, allow me first to say that this writing is largely meant
          to be a humor. I mean, it's humorous for me, I don't expect anyone
          else to find it humorous as well.
        </p>
        <p class="note">
          I wrote this at whim when I decided to try{" "}
          <a href="https://freecodecamp.com">freecodecamp</a>. There was this
          part where I was supposed to make a tribute of anything. Not
          surprisingly, it didn't came out right. (And yes, the mispellings are
          part of the humor)
        </p>
        <hr />
        <p>
          A reader, who is taken aback by this sudden aggression towards his
          second least favorite digimon, may ask "But why"?
        </p>
        <p>
          Upon the reception of the question, I made a sour face to which I
          consider the wrong question.
        </p>
        <p>No my dear reader you are asking all but the wrong question.</p>
        <p>You do not ask "Why is it dumb?", but "How is it dumb?"</p>
        <p>
          The reader, not knowing any worse, gladly obliged and ask "How is it
          dumb?"
        </p>
        <p>
          "Dumb is it how?" I said with a prolonged thick accent of an amateur
          digimon connosieure.{" "}
        </p>
        <p>
          "Dumb is it how..?" I echoed my own voice as I think of a reason why
          this conversation even started.
        </p>
        <p>
          Pitiful creature, I stared at the confounded eyes who blindly expects
          truth.
        </p>
        <p>
          I drew a recently printed image of this dumb animal in question from
          my backpack.
        </p>
        <p>
          I tried to maintain civility by not shoving into his face the sheer
          obviousness of the dumbness of this dumb animal this is.
        </p>
        <p>
          Instead, I held the image with uttmost possible courteousness within
          his view frustrum and let the image itself project the meaning of
          dumbness directly towards his dysfunctional eyeballs.
        </p>
        <p>.............</p>
        <img
          class="bulb"
          src='{{url "/images/bulbasaur_by_elfaceitoso-deviantart-aa94.png"}}'
        />
        <p>
          Without words to evolve the suspended state of affairs, I interrupted
          the blank stare that was spiraling towards the void of cluelessness.
        </p>
        <p>"Well?"</p>
        <p>"Well what?"</p>
        <p>
          "Well what do you think? Have you not arrived at the platform of
          epiphany where you were supposed to meet my delightful cohort called
          my-point-being?"
        </p>
        <p>
          "What in guddarn name of pokeballs are you talking about? I see
          nothing dumb with this picture."
        </p>
        <p>
          Oh credulity! Don't leave me behind! I beg of thee! It's not what you
          think, let me explain!
        </p>
        <p>
          My neglected acting lessons were put into action as I performed a
          sololiquy in the face of disbelief. A person can only be serious in a
          topic as serious as this. This person does not joke. He is the joke.
        </p>
        <p>
          I settled down after performing a local folk dance that is known for
          it's exaggerated hand movements.
        </p>
        <p>
          "Well, let us see, where do I begin?" Is it the protuding ginormous
          onion on it's back? Or those ears that lack holes where the drums
          should have been? Maybe the skin patches caused by a persistent skin
          disease? No, no, no, that's not how it's dumb...
        </p>
        <p>
          I convoluted, struggled for the precise sentence that will pass the
          unforgiving panel of the post-doctorate dissertation entitled "The
          sheer dumb stupidity of the least favorite digimon character:
          Blubasaurus".
        </p>
        <p>
          I threw my hands away in resignation. More-refined, astute gentlemen
          have expressed their rigorous arguments on this matter in a more
          eloquent manner.
        </p>
        <p>
          "Here,{" "}
          <a href="https://en.wikipedia.org/wiki/Bulbasaur">
            the proof is here.
          </a>
          "
        </p>
        <p>
          The persistent creature, not knowing when to accept defeat, blurted
          out even before I could step away.
        </p>
        <p>
          "There's nothing in that document that supports your claim! Bulbasaur
          is not dumb!"
        </p>
        <p>
          "Foolish child, have you not learned to read the words between the
          lines? It's in there, buried thousand words deep in what is disguised
          as quote informative content unquote".
        </p>
        <p>
          Upon hearing my convincing words, the unsuspecting bulbisuar apologist
          took a second look and quadruple-checked the hidden meaning, all the
          while I excused myself away from the scene.
        </p>
        <p>
          My conviction remains pure and strong, no matter how unprovable or
          unsupported they are. Balbusaur is a dumb animal.
        </p>
        <style>
          {`
            .bulb {
                width: 100%;
                background-color: #333;
            }
            .note {
                font-size: 14px;
                font-family: Monospace;
            }
        `}
        </style>
      </div>
    </Layout>
  );
};