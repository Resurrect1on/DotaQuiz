//
//  ViewController.swift
//  Guess the hero name
//
//  Created by Dmitry on 26.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let heroes = ["Abaddon", "Alchemist", "Ancient Apparation", "Anti-Mage", "Arc Warden", "Axe", "Bane", "Batrider", "Beastmaster", "Bloodseeker", "Bounty Hunter", "Brewmaster", "Bristleback", "Broodmother", "Centaur Warrunner", "Chaos Knight", "Chen", "Clinkz", "Clockwerk", "Crystal Maiden", "Dark Seer", "Dark Willow", "Dawnbreaker", "Dazzle", "Death Prophet", "Disruptor", "Doom", "Dragon Knight", "Drow Ranger", "Earthspirit", "Earthshaker", "Elder Titan", "Ember Spirit", "Enchantress", "Enigma", "Faceless Void", "Grimstroke", "Gyrocopter", "Hoodwink", "Huskar", "Invoker", "Wisp", "Jakiro", "Juggernaut", "Keeper of the Light", "Kunkka", "Legion Commander", "Leshrac", "Lich", "Lifestealer", "Lina", "Lion", "Lone Druid", "Luna", "Lycan", "Magnus", "Marci", "Mars", "Medusa", "Meepo", "Mirana", "Monkey King", "Morphling", "Naga Siren", "Nature's Prophet", "Necrophos", "Night Stalker", "Nyx Assasin", "Ogre Magi", "Omniknight", "Oracle", "Outworld Destroyer", "Pangolier", "Phantom Assasin", "Phantom Lancer", "Phoenix", "Primal Beast", "Puck", "Pudge", "Pugna", "Queen of Pain", "Razor", "Riki", "Rubick", "Sand King", "Shadow Demon", "Shadow Fiend", "Shadow Shaman", "Silencer", "Skywrath Mage", "Slardar", "Slark", "Snapfire", "Sniper", "Spectre", "Spirit Breaker", "Storm Spirit", "Sven", "Techies", "Templar Assasin", "Terrorblade", "Tidehunter", "Timbersaw", "Tinker", "Tiny", "Treant Protector", "Troll Warlord", "Tusk", "Underlord", "Undying", "Ursa", "Vengeful Spirit", "Venomancer", "Viper", "Visage", "Void Spirit", "Warlock", "Weaver", "Windranger", "Winter Wyvern", "Witch Doctor", "Wraith King", "Zeus"]
    let skills = ["Дом Аверно", "Монетка", "Ледяной шар", "Крип", "Самость", "Топор", "Кошмар", "Ластпик w33 90% wr", "Рычит на тебя", "Кровь трансфер", "Крик Витюши", "Пивная панда", "Герой которого не нужно бить", "Арахнофобия", "Бм на максималках", "Адский конь", "Puppey main", "Невидимая кость", "Ключ на 9", "Няша-стесняша поз5", "Стенка-стяжка", "Пора доджить кусты", "Ангел, летающий по всей мапе", "Гив ми грейв", "20 духов-подружек", "С аганом и нагой - имба", "Люцифер", "Аниме-протагонист", "Эльфиечка со светлыми волосами", "Ëрш", "Землетряс", "Астральный дух на +800 урона", "У него есть скин на рапиру", "Козочка", "ЛОСТ БКБШЕЧКА", "Глаза потерялись", "Связка на 2-х героев", "Старик в вертолете", "Белка", "Ластпик вр 90%", "Эльф-педофил", "Шарик лопнул", "Двухглавый дракон", "У самурая нет цели, только путь", "80-летний казанова", "Я останусь здесь, чтобы ты жил!", "Честная дуэль (1в5)", "Two legged abomination", "Чайник", "Гуль", "Горящая девочка", "Фингер", "Мой лучший друг - медведь", "Вызывает затмение", "АУФ", "Коллапс", "Лучшая девочка в аниме", "Копьё всегда мимо", "Она делает из тини камень", "4 оффника", "Пятисекундная стрела", "У кого-то один облик. У меня их шесть дюжин", "3 полигона", "Певица", "Daxak main", "Гнилой дед", "Вампир", "Жук", "2 головы лучше одной", "Бесполезный кусок кода, который иногда тебя хилит", "Предсказатель судьбы", "Орба на 1000 чистого урона", "Кот в сапогах", "Сестры вуали", "30 котов с копьем", "Птичка", "Бьёт тебя об землю", "Разговаривает с виспом", "Я играю в доту по этим причинам", "Хозяин вайпера", "Любит кричать на тебя", "Гроза", "Инвизная имба", "Воришка", "Сидит в песочке", "Озкавош", "zxc", "Растаман", "Shut up!", "Петух", "Селёдка", "Тёмный рифт", "Бабуля с печеньками", "Дед с большим стволом", "Меркуриал", "Пиво", "Зип-Зап!", "Важен не размер меча, а то как ты им пользуешься", "Травоман", "Псишки", "Анти-маг на максималках", "Бойфренд Кунки", "Деревофил", "Гавриков пустили", "Камень", "Дерево", "Дальник+Милик", "Морж", "скилл+атос+скилл", "Зомби", "яжемать", "Павшая принцесса без крыльев", "Змея", "Гадюка", "Горгулья", "Кидаю step, лечу прям вверх, мой красный сет убил их всех", "Чернокнижник", "Его 2-й спелл - отсылка на аниме", "Привязывает под любым углом", "WHYUDIDTHIS??", "Жарвакко", "Папич", "Главный из богов"]
    
    var scoring = 0
    var scoringStraight = 0
    var chosenHeroes = [Int] ()
    var shuffled = [Int] ()

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var scoreStraight: UILabel!
    @IBOutlet weak var skillName: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    @IBOutlet weak var green: UIImageView!
    @IBOutlet weak var red: UIImageView!
    
    func nukeAllAnimations() {
        self.view.subviews.forEach({$0.layer.removeAllAnimations()})
        self.view.layer.removeAllAnimations()
        self.view.layoutIfNeeded()
    }
    
    func fourBesties () {
        var fourHeroes = [Int] ()
        while fourHeroes.count != 4 {
            let random = Int.random(in: 0..<heroes.count)
            if !chosenHeroes.contains(random) && !fourHeroes.contains(random) {
                fourHeroes.append(random)
            }
        }
        chosenHeroes.append(fourHeroes.last!)
        shuffled = fourHeroes.shuffled()
    }
    
    func progressCheck () {
        if chosenHeroes.count == 120 {
            let chosenLast = chosenHeroes.last!
            chosenHeroes.removeAll()
            chosenHeroes.append(chosenLast)
        }
    }
    
    
    @IBAction func touch(_ sender: UIButton) {
        progressCheck()
        var mainTag = 0
        for i in 0...3 {
            if shuffled[i] == chosenHeroes.last {
                mainTag = i
            }
        }
        if sender.tag == mainTag {
            scoring += 1
            scoringStraight += 1
            
            nukeAllAnimations()
            UIImageView.animate(withDuration: 0.5, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction], animations: {
                self.green.alpha = 1
            }, completion: {_ in
                UIImageView.animate(withDuration: 0.5) {
                    self.green.alpha = 0
                }
            })
        }
        else {
            scoringStraight = 0
            
            nukeAllAnimations()
            UIImageView.animate(withDuration: 0.5, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction], animations: {
                self.red.alpha = 1
            }, completion: {_ in
                UIImageView.animate(withDuration: 0.5) {
                    self.red.alpha = 0
                }
            })
            }
        
        score.text = ("Score \(scoring)")
        scoreStraight.text = ("\(scoringStraight) in a row")
        
        fourBesties()
        skillName.text = ("\(skills[chosenHeroes.last!])")
        firstButton.setTitle(heroes[shuffled[0]], for: .normal)
        secondButton.setTitle(heroes[shuffled[1]], for: .normal)
        thirdButton.setTitle(heroes[shuffled[2]], for: .normal)
        fourthButton.setTitle(heroes[shuffled[3]], for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fourBesties()
        skillName.text = ("\(skills[chosenHeroes.last!])")
        firstButton.setTitle(heroes[shuffled[0]], for: .normal)
        secondButton.setTitle(heroes[shuffled[1]], for: .normal)
        thirdButton.setTitle(heroes[shuffled[2]], for: .normal)
        fourthButton.setTitle(heroes[shuffled[3]], for: .normal)
    }
}

