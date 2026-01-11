function fish_greeting
    # Fetch the hostname dynamically
    set -l device (hostname)
    
    set -l quotes \
        "The mark of a moderate man is freedom from his own ideas. (Lao Tzu)" \
        "Governing a large country is like frying a small fish. You spoil it with too much poking. (Lao Tzu)" \
        "The soul becomes dyed with the color of its thoughts. (Marcus Aurelius)" \
        "Waste no more time arguing about what a good man should be. Be one. (Marcus Aurelius)" \
        "He who lives in harmony with himself lives in harmony with the universe. (Marcus Aurelius)" \
        "When you are content to be simply yourself and don't compare or compete, everyone will respect you. (Lao Tzu)" \
        "The best way to avenge yourself is to not be like that. (Marcus Aurelius)" \
        "The journey of a thousand miles begins with a single step. (Lao Tzu)" \
        "It is not death that a man should fear, but he should fear never beginning to live. (Marcus Aurelius)" \
        "Assembly of Japanese bicycle require great peace of mind. (Robert Pirsig)"

    # Randomly pick one (Works in Fish 4.x)
    set -l index (random 1 (count $quotes))
    set -l chosen_quote $quotes[$index]

    echo -e "\n"
    set_color cyan; echo "─── Wisdom for $device ───"
    set_color --italics; set_color white; echo "$chosen_quote"
    set_color normal; echo -e "\n"
end
