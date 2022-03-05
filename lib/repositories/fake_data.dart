import 'package:books_store_app/models/admin.dart';
import 'package:books_store_app/models/author.dart';
import 'package:books_store_app/models/book.dart';
//
// List<News> fakeLatestNews = [
//   News(
//       title: 'Print books had a huge sales year in 2021',
//       body:
//           'Unit sales of print books rose 9% in 2021 over 2020 at outlets that report to NPD BookScan. 826 million print units were sold last year, a jump of nearly 68 million over 2020 and a whopping 132 million over 2019. The young adult fiction segment had the largest increase, with unit sales jumping 31%, while adult fiction sales rose 26%. Sales in the juvenile fiction category increased 10%.',
//       date: 'Jan 06 2022',
//       type: NewsType.Knowledge),
//   News(
//       title: 'Record number of libraries hit million digital landmark',
//       body:
//           'Leading library service provider Over Drive this week reported that a total of 121 public libraries and consortia across seven countries and 37 U.S. states surpassed one million digital lends in 2021. The number represents a significant jump from 2020, when 102 libraries hit the mark, although more libraries (29) joined the million+ club in 2020.',
//       date: 'Jan 13 2022',
//       type: NewsType.Good),
//   News(
//       title: 'When listening to a book is better than reading it',
//       body:
//           'When the market for audio books began to skyrocket in about the past decade, people would sometimes wonder whether they counted — that is when you listened to the book, could you say that you had read it? It was a mostly silly metaphysical debate, but the question illustrated a deep cultural bias.',
//       date: 'Oct 06 2021',
//       type: NewsType.Knowledge),
//   News(
//       title:
//           'Joan Didion, whose \'electric anxiety\' inspired a generation, has died at 87',
//       body:
//           'American novelist, journalist and essayist Joan Didion died on Thursday at her home in New York at age 87 from Parkinson\'s disease, according to Knopf publicist Paul Bogaards. The bestselling writer began describing her home state, California, for magazines in the 1960s and broadened her subjects over the decades in nonfiction, fiction and films.',
//       date: 'Dec 23 2021',
//       type: NewsType.Bad),
//   News(
//       title: 'Nobel Literature Prize 2021: Abdulrazak Gurnah named winner',
//       body:
//           'Tanzanian novelist Abdulrazak Gurnah has said he was "surprised and humbled" to be awarded the 2021 Nobel Prize for Literature. The Swedish Academy praised Gurnah for his "uncompromising and compassionate penetration of the effects of colonialism". The prize is awarded by the Swedish Academy and is worth 10 million Swedish crowns (\$1.14m / £840,000). Gurnah, 73, is the author of 10 novels, including Paradise and Desertion.',
//       date: 'Oct 07 2021',
//       type: NewsType.Good),
//   News(
//       title: '2021 Booker Prize Shortlist',
//       body:
//           'Six titles made the shortlist for this year\'s Booker Prize for Fiction, one of the most prestigious prizes for English-language literature. This year\'s finalists were chosen from 158 novels published in the U.K. or Ireland between October 1, 2020, and September 30, 2021. The 2021 winner, who will receive £50,000, will be announced on November 3 in an award ceremony held in partnership with the BBC. \nThe 2021 shortlist is:\nA Passage North by Anuk Arudpragasam (Hogarth)\nThe Promise by Damon Galgut (Europa)\nNo One is Talking About This by Patricia Lockwood (Riverhead)\nThe Fortune Men by Nadifa Mohamed (publishing in the US in March 2022, Knopf)\nBewilderment by Richard Powers (W. W. Norton)\nGreat Circle by Maggie Shipstead (Knopf)',
//       date: 'Sep 15 2021',
//       type: NewsType.Completed),
//   News(
//       title: 'Ten things nobody tells you about the publishing industry',
//       body:
//           'An article by Kilby Blades, bestselling author of romance and women’s fiction and a digital marketing veteran. There’s more to authoring than conquering the blank page. Dozens of unique quirks of industry factor into the experience of a creative. If you’re an aspiring writer with traditional publishing in mind, pay attention. Here’s what to expect from author life: The industry moves slowly. Very slowly. The publishing machine is overloaded. More manuscripts are submitted than agents and editors can comfortably review. Even established authors can wait weeks or months to hear back on submissions. And even once you receive an offer, the contract process takes time. That’s just on the acquisition side—on the publishing side, editorial cycles can lag, with digital-first projects taking up to a year from contract to publication and print projects taking up to two.',
//       date: 'Sep 30 2021',
//       type: NewsType.Knowledge),
// ];

List<Book> currentlyReading = [
  Book(
      name: 'War and Peace',
      authorId: 2,
      background:
          'A legendary masterpiece, this book is synonymous with difficult reading, so why not challenge yourself.',
      price: '21.0',
      poster: 'https://images4.penguinrandomhouse.com/cover/9781400079988'),
  Book(
      name: 'Song of Solomon',
      authorId: 3,
      background:
          'One must always read a novel by this Nobel Prize winning author.',
      price: '16.0',
      poster: 'https://images3.penguinrandomhouse.com/cover/9781400033423'),
  Book(
      name: 'Ulysses',
      authorId: 4,
      background:
          'Joyce’s parallel use of The Odyssey has the importance of the scientific discovery.',
      price: '18.0',
      poster: 'https://images3.penguinrandomhouse.com/cover/9780679722762'),
  Book(
      name: 'The Shadow of the Wind',
      authorId: 5,
      background: 'An incredible book by a beloved writer is a must-read.',
      price: '34.0',
      poster: 'https://images2.penguinrandomhouse.com/cover/9780143126393'),
];

List<Author> fakeTopAuthors = [
  Author(
    name: 'George Orwell',
    image:
        "https://media.gettyimages.com/photos/orwell-george-2506190321011950-writer-great-britain-portrait-ca-1940-picture-id548183633?k=20&m=548183633&s=612x612&w=0&h=eXzJaA-a1f2IlzbMTNiC1vHzE0yUfRxYrC35DqaJ4vY=",
    booksNum: '13',
  ),
  Author(
    name: 'Leo Tolstoy',
    image:
        "https://media.gettyimages.com/photos/count-leo-tolstoi-russian-novelist-and-social-and-moral-philosopher-picture-id514877408?k=20&m=514877408&s=612x612&w=0&h=V1AVUP4O9zJYbkZ-3k2kTOQ2HveFkxHt4DuFFRcQe6I=",
    booksNum: '25',
  ),
  Author(
    name: 'Toni Morrison',
    image:
        "https://media.gettyimages.com/photos/pulitzer-prizewinning-author-toni-morrison-photographed-in-new-york-picture-id481665793?k=20&m=481665793&s=612x612&w=0&h=o6RxFp5F3pk14-JDpbEZ93qApNSDpeFabIxmhIutZVU=",
    booksNum: '7',
  ),
  Author(
    name: 'James Joyce',
    image:
        "https://media.gettyimages.com/photos/circa-1917-portrait-of-irish-author-james-joyce-wearing-a-hat-a-a-picture-id3224949?k=20&m=3224949&s=612x612&w=0&h=AV5GhW8jQ1lfJ1Br9Fcobca4i2PaD9CzD0_9YLoXStc=",
    booksNum: '7',
  ),
  Author(
    name: 'Carlos Ruiz Zafon',
    image:
        "https://media.gettyimages.com/photos/carlos-ruiz-zafon-barcellona-writer-milan-italy-13th-september-2017-picture-id1129550561?k=20&m=1129550561&s=612x612&w=0&h=P3EhCUPClqSIjIFkaGNK0H1Nu_gUf22OdzRwH-WQaac=",
    booksNum: '9',
  ),
  Author(
    name: 'J.R.R. Tolkien',
    image:
        "https://media.gettyimages.com/photos/portrait-of-british-author-jrr-tolkien-undated-photograph-filed-picture-id515557308?k=20&m=515557308&s=612x612&w=0&h=6pliFNAXPh31WKtBgjtXtKWzwmkkl1VT510MGm3ZM44=",
    booksNum: '29',
  ),
];

List<Author> fakeAuthors = [
  Author(
    name: 'Leo Tolstoy',
    image:
        "https://media.gettyimages.com/photos/count-leo-tolstoi-russian-novelist-and-social-and-moral-philosopher-picture-id514877408?k=20&m=514877408&s=612x612&w=0&h=V1AVUP4O9zJYbkZ-3k2kTOQ2HveFkxHt4DuFFRcQe6I=",
    booksNum: '25',
  ),
  Author(
    name: 'Toni Morrison',
    image:
        "https://media.gettyimages.com/photos/pulitzer-prizewinning-author-toni-morrison-photographed-in-new-york-picture-id481665793?k=20&m=481665793&s=612x612&w=0&h=o6RxFp5F3pk14-JDpbEZ93qApNSDpeFabIxmhIutZVU=",
    booksNum: '7',
  ),
  Author(
    name: 'James Joyce',
    image:
        "https://media.gettyimages.com/photos/circa-1917-portrait-of-irish-author-james-joyce-wearing-a-hat-a-a-picture-id3224949?k=20&m=3224949&s=612x612&w=0&h=AV5GhW8jQ1lfJ1Br9Fcobca4i2PaD9CzD0_9YLoXStc=",
    booksNum: '7',
  ),
  Author(
    name: 'Carlos Ruiz Zafon',
    image:
        "https://media.gettyimages.com/photos/carlos-ruiz-zafon-barcellona-writer-milan-italy-13th-september-2017-picture-id1129550561?k=20&m=1129550561&s=612x612&w=0&h=P3EhCUPClqSIjIFkaGNK0H1Nu_gUf22OdzRwH-WQaac=",
    booksNum: '9',
  ),
  Author(
    name: 'George Orwell',
    image:
        "https://media.gettyimages.com/photos/orwell-george-2506190321011950-writer-great-britain-portrait-ca-1940-picture-id548183633?k=20&m=548183633&s=612x612&w=0&h=eXzJaA-a1f2IlzbMTNiC1vHzE0yUfRxYrC35DqaJ4vY=",
    booksNum: '13',
  ),
  Author(
    name: 'J.R.R. Tolkien',
    image:
        "https://media.gettyimages.com/photos/portrait-of-british-author-jrr-tolkien-undated-photograph-filed-picture-id515557308?k=20&m=515557308&s=612x612&w=0&h=6pliFNAXPh31WKtBgjtXtKWzwmkkl1VT510MGm3ZM44=",
    booksNum: '29',
  ),
  Author(
    name: 'Salman Rushdie',
    image:
        "https://media.gettyimages.com/photos/salman-rushdie-2019-booker-prize-shortlisted-author-at-the-cheltenham-picture-id1175394037?k=20&m=1175394037&s=612x612&w=0&h=sESt7Jo2vdF9FQx5n7QV9ZACuQdvrTs5i3nGMAL0cVQ=",
    booksNum: '6',
  ),
  Author(
    name: 'Miguel de Cervantes',
    image:
        "https://media.gettyimages.com/photos/portrait-of-miguel-de-cervantes-saavedra-detail-found-in-the-of-real-picture-id917743808?k=20&m=917743808&s=612x612&w=0&h=C8DCywBmtS60aChCNBoRA-zdIjiDX8R8oJInv2-FTaI=",
    booksNum: '8',
  ),
  Author(
    name: 'Philip Pullman',
    image:
        "https://media.gettyimages.com/photos/author-philip-pullman-poses-for-a-portrait-at-the-oxford-literary-in-picture-id98087201?k=20&m=98087201&s=612x612&w=0&h=bD3wV37XN_-apQo114EL9Mry3CItaIQyuE6o9AsPJPs=",
    booksNum: '9',
  ),
  Author(
    name: 'Joseph Heller',
    image:
        "https://media.gettyimages.com/photos/joseph-heller-newly-elected-member-of-the-american-academy-and-of-picture-id515407204?k=20&m=515407204&s=612x612&w=0&h=V9dUVcpxfpoLsoGlodK0LZK9xq6stUUmVK8f5mMrTKQ=",
    booksNum: '10',
  ),
  Author(
    name: 'Khaled Hosseini',
    image:
        "https://media.gettyimages.com/photos/khaled-hosseini-american-writer-mantova-italy-11th-march-2014-picture-id1129593818?k=20&m=1129593818&s=612x612&w=0&h=v78UZvWelfKkNc23eK6iNMgZ7xWXs0bdWoGTBSKQBHo=",
    booksNum: '3',
  ),
  Author(
    name: 'Louisa May Alcott',
    image:
        "https://media.gettyimages.com/photos/louisa-may-alcott-american-novelistauthoress-of-little-women-29-1832-picture-id171400134?k=20&m=171400134&s=612x612&w=0&h=qBul8zjCH-7loNlPDtACs0C7KaGcCQIoY7MGV2xQMrM=",
    booksNum: '7',
  ),
  Author(
    name: 'David Mitchell',
    image:
        "https://media.gettyimages.com/photos/director-david-robert-mitchell-attends-it-follows-new-york-screening-picture-id464435600?k=20&m=464435600&s=612x612&w=0&h=2-kUvS7XrZec9cVNbeD9jYFZw4waHIGgm2Q9v69i_FQ=",
    booksNum: '6',
  ),
  Author(
    name: 'Ayn Rand',
    image:
        "https://media.gettyimages.com/photos/russianborn-american-author-and-philosopher-ayn-rand-smiles-and-picture-id3241670?k=20&m=3241670&s=612x612&w=0&h=4D8Gn1AuElm_lwq0FpyM34cXF9XP9QdVD6HMtQ5xRm0=",
    booksNum: '5',
  ),
  Author(
    name: 'Oscar Wilde',
    image:
        "https://media.gettyimages.com/photos/oscar-wilde-irish-writer-colourized-photo-picture-id56217307?k=20&m=56217307&s=612x612&w=0&h=7Qk94tIBEt4hv6RzRThcYTwLas23LCOQjVBc28bLQnE=",
    booksNum: '15',
  ),
  Author(
    name: 'Vladimir Nabokov',
    image:
        "https://media.gettyimages.com/photos/vladimir-nabokov-american-writer-born-in-russia-author-of-the-novel-picture-id517332138?k=20&m=517332138&s=612x612&w=0&h=T9OaEVOLKfsEXwPRN9EfyUYppgG9jtRf4sq3t54MlHo=",
    booksNum: '11',
  ),
  Author(
    name: 'Kathryn Stockett',
    image:
        "https://media.gettyimages.com/photos/writer-kathryn-stockett-attends-the-help-photocall-during-day-3-of-picture-id130622613?k=20&m=130622613&s=612x612&w=0&h=8Azc9HkkUe5fPPrt_O0IErY6FFq4eF8dErQRuhH0MNo=",
    booksNum: '1',
  ),
  Author(
    name: 'Mary Karr',
    image:
        "https://media.gettyimages.com/photos/poet-essayist-and-memoirist-mary-karr-poses-for-a-portrait-in-2011-in-picture-id689774746?k=20&m=689774746&s=612x612&w=0&h=NB4_BaG1p6vvnUjNN5CF350xkFC3WBKjAVUwUBYhdME=",
    booksNum: '5',
  ),
  Author(
    name: 'Herman Melville',
    image:
        "https://media.gettyimages.com/photos/herman-melville-american-poet-and-storyteller-author-of-the-famous-picture-id588889799?k=20&m=588889799&s=612x612&w=0&h=9DXAwMxueogBVhTLRrZ3l3rEl6DYDVV_7fJ4nX99Kxo=",
    booksNum: '8',
  ),
  Author(
    name: 'Thomas Pynchon',
    image:
        "https://media.gettyimages.com/photos/portrait-of-author-thomas-r-pynchon-1955-photograph-picture-id515120378?k=20&m=515120378&s=612x612&w=0&h=c9XG41TXNoHl49fjrgfDpIIITKbnbZdIDKj9CGlJdFU=",
    booksNum: '9',
  ),
  Author(
    name: 'Margaret Atwood',
    image:
        "https://media.gettyimages.com/photos/canadian-poet-novelist-literary-critic-essayist-inventor-and-for-picture-id886964876?k=20&m=886964876&s=612x612&w=0&h=azDR00nue1FaKL1PR2AXaXW0-hHtF-O43aOPyZSzmDA=",
    booksNum: '13',
  ),
];

List<String> categories = [
  'Classics',
  'Adventure',
  'Biography',
  'Short Stories',
  'Dystopia',
  'Fantasy',
  'Horror',
  'Science',
  'ScienceFiction',
  'Romance',
  'Cookbooks',
  'History',
  'Detective and Mystery',
  'Literary Fiction',
  'Comic ',
  'Action',
  'Poetry',
];

String authorDesc =
    'was born in Bengal and educated at Eton; after service with the Indian Imperial Police in Burma, he returned to Europe to earn his living penning novels and essays. He was essentially a political writer who focused his attention on his own times, a man of intense feelings and intense hates. An opponent of totalitarianism, he served in the Loyalist forces in the Spanish Civil War. Besides his classic Animal Farm, his works include a novel based on his experiences as a colonial policeman, Burmese Days, two firsthand studies of poverty, Down and Out in Paris and London and The Road to Wigan Pier, an account of his experiences in the Spanish Civil War, Homage to Catalonia; and the extraordinary novel of political prophecy whose title became part of our language, 1984.';
List<Admin> admins = [
  Admin(
    name: 'ElGml',
    email: 'elgml@gmail.com',
    password: '1111',
    image:
        'https://media.gettyimages.com/photos/handsome-young-adult-businessman-with-stubble-picture-id1250238624?k=20&m=1250238624&s=612x612&w=0&h=35Sf2RXBiMDoaabub7XpBV--FM_wuEf8R1lbgO_GquM=',
    role: AdminRoles.Admin,
    phoneNumber: '01020304050',
    online: true,
  ),
  Admin(
    name: 'Ahmed',
    email: 'ahmed@gmail.com',
    password: '1234',
    image:
        'https://media.gettyimages.com/photos/handsome-mid-adult-businessman-with-stubble-picture-id1179627266?k=20&m=1179627266&s=612x612&w=0&h=IvS_aQhggVBkbH2NxtE43nE2mA3s2YQSWUZ11t66Sqc=',
    role: AdminRoles.Moderator,
    phoneNumber: '01060306050',
    online: true,
  ),
  Admin(
    name: 'sara',
    email: 'sara@gmail.com',
    password: '1234',
    image:
        'https://media.gettyimages.com/photos/happy-female-brunette-ceo-wearing-blue-denim-shirt-picture-id1179627283?k=20&m=1179627283&s=612x612&w=0&h=WBkaJi9LCv7RBpoxs_1tPetuDGPtA51w3pQ_F3vJRbA=',
    role: AdminRoles.Moderator,
    phoneNumber: '01070307050',
    online: true,
  ),
  Admin(
    name: 'omar',
    email: 'omar@gmail.com',
    password: '1234',
    image:
        'https://media.gettyimages.com/photos/bearded-businessman-against-gray-background-picture-id1179627332?k=20&m=1179627332&s=612x612&w=0&h=-3GvRzpFhIgeZezKcd3qPH4bC0z2hrr93hNzyn7HYaQ=',
    role: AdminRoles.Analyst,
    phoneNumber: '01028004800',
    online: false,
  ),
  Admin(
    name: 'nour',
    email: 'nour@gmail.com',
    password: '1234',
    image:
        'https://media.gettyimages.com/photos/smiling-young-female-afro-owner-against-white-background-picture-id1277534997?k=20&m=1277534997&s=612x612&w=0&h=6DPWIARdpy24KdTI_KWV8nhrGylV-naUTOIGUQLu9W4=',
    role: AdminRoles.Editor,
    phoneNumber: '01029004090',
    online: true,
  ),
];
