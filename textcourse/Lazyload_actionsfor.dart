// ignore_for_file: file_names
/// 1) Сделать цвет аппбара в теме материалапп
/// создаем класс на стл виджете для самого экрана, возвращаем столбец(column), и в нем
/// текст '705 original gifts'
/// отступ в этих детях колонки через SizeBox по вертикали
/// по горизонтали 0 обернул текст в паддинг и задал edgeinsets.simmetr horizontal
/// далее класс форм ввода на стф виджете
///меняет вид текстфилд через декоратор - рамки и отступы через паддинг
///
///создаёт методы в стэйте и пускает их на кнопки
///дальше создает переменные с текст эдитин контроллер
///после методов запихнуть сетстейт для перерисовки
///
///чтобы в виджет вынесенный отдельно быстро создать конструктор с параметрами - 
///- добавляем эти парам через final вначале, потом щелкаем ctrl+. по имени этих
///параметров и выбираем сгенер конструктор
///
///когда надо что-то переносить из одного окна во второй не переключаясь просто
///выбрать в верхних пунктах меню split right
///
///обернул виджет в стэк и добавил текстфилд с инпутдекорэйшн 
///создать переменную с текст эдитин контроллер и добавить его в текстфилд
///виджет должен быть стэйтфул
///далее нужно добавить слушателя на эту переменную в инитстэйт
///
///!В билде должна быть только верстка, так как вызывается каждый раз при перестроении
///Для примера выше слушателя туда добавлять Нельзя!
///
///сделать кнопку так *место для определения нажатия на кнопку через Gesture Detector ? (тогда)
///закрашенная нажатая кнопка и вывод нужной группы виджетов
///в категориях : (иначе) отображение ничего не закрашенной кнопки и всё.
///
///При наследовании(extends) классов мы можем передавать от родительского класса
///(только одного в отличие от других ниже) переменные и методы вместе с реализацией. 
///А наследник обязан их реализовывать, либо переопределить(@override). Обратиться к 
///родителю через super или дополнить своими методами.
///
///При реализации (implements) из класса берется только наличие чего либо - свойства, 
///метода. При этом у метода может быть реализация, он ее отбросит и оставит только
///наличие. То есть берет у класса его интерфейс(использует класс как интерфейс), наличие свойств и методов.
///Имплементс это не наследование, а требование реализовать все то же самое что есть у
///реализуемого класса.
///
///Абстрактные классы - классы, у которых тебе не нужны его объекты(в абстрактных
///классах и не позволит создать экземпляр этого класса) а нужны только свойства и методы.
///Еще плюс абстрактного класса - может не иметь реализации у своих свойств.
///
///mixin - в отличие от интерфейсов у implements позволяют подмешать именно реализацию
///этих классов(можно больше одного в отличие от extends). 
///
///extension(extension НовоеИмяКласса on ИмяКлассаКотороеМеняем{}) позволяет дописать
///что-то к классу, к которому у нас нет доступа - новые методы в переменные int,
///double, String и тд. При этом есть ограничение, что можно дописывать только функционал.
///Хранить значение переменных и тп, он не может, только геттеры, сеттер и те же
///методы. На практике считается моветон(расширение чужих классов)
///
///Видео 1 - переменные
///
///Еще раз, аргументы - это то что принимает функция в обычных
///скобках после имени
///dynamic - когда переменная объявляется через var или dynamic
///без присвоения значения. Потом ей можно присвоить значение любого типа
///
///!отличие final от const
///файнал устанавливается в рантайме - когда приложение физически запускается у пользователя
///конст - на этапе сборки(компиляции) у разработчика на компе
///разница в том что для файнал нужны ресурсы телефона для установления значения,
///а в конст это значение уже просто есть.
///Правило простое - объявлять все по макс константами, если нельзя, например сетевой запрос
///тогда файнал
///
///Приорите у bool выражений
///сначала &&(это и), || (это или) и выражение сравнения (==)
///
///Как сделать из строки число
///int.parse('4');
///если вместо parse tryparce - если не получится то выйдет налл(null)
///
///null - пустота
///Частая ошибка, когда ее складывают с чем-то или другие операции проводят, и будет
///выдавать ошибку null-safety, введенный в дарт 2.12, потому что к пустоте
///нельзя прибавить число, отнять, умножить. К 0 можно это делать, а к 
///null(пустоте) нельзя.
///Чтобы допустить что значение может быть null(то есть  nullable), можно поставить
///   ? после типа переменной.
///      ?? - выражение значения по умолчанию, например r ?? 6, здесь если с r будет проблема
///с null safety, то будет использоваться 6.