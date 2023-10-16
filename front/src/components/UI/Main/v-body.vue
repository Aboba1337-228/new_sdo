<template>
    <div class="v-body">
        <Card 
            title="Ресурс №1 для изучения биологии, химии и физики" 
            text="Учиться с ОЭШ весело и интересно. Зарабатыайте очки за правильные ответы, открывайте новые материалы и узнавайте новое. Наши видео-уроки помогут вам в этом" 
            image="/body/card_icon.png" />
        <div class="v-card-mini">
            <h2>Почему вам обязательно понравится ОЭШ?</h2>
            <div class="v-card-inner">
                <CardMini 
                    image="/body/icon1.png"
                    title="Быстрый прогресс" 
                    body="Исследования показали, что наши курсы эффективно развивают навыки чтения, устной речи и понимания на слух" />
                <CardMini 
                    image="/body/icon2.png"
                    title="Быстрый прогресс" 
                    body="Исследования показали, что наши курсы эффективно развивают навыки чтения, устной речи и понимания на слух" />
                <CardMini 
                    image="/body/icon3.png"
                    title="Быстрый прогресс" 
                    body="Исследования показали, что наши курсы эффективно развивают навыки чтения, устной речи и понимания на слух" />
                <CardMini 
                    image="/body/icon4.png"
                    title="Быстрый прогресс" 
                    body="Исследования показали, что наши курсы эффективно развивают навыки чтения, устной речи и понимания на слух" />
            </div>
        </div>
        <Card 
            title="Ресурс №1 для изучения биологии, химии и физики" 
            text="Учиться с ОЭШ весело и интересно. Зарабатыайте очки за правильные ответы, открывайте новые материалы и узнавайте новое. Наши видео-уроки помогут вам в этом" 
            image="/body/card_icon2.png" />
    </div>
</template>

<script>
import Card from '../CardMain/v-card-big.vue'
import CardMini from '../CardMain/v-card-mini.vue'

export default {
    components: {
        Card,
        CardMini
    }
}
</script>

<style scoped>
.v-card-inner {
    display: flex;
    flex-wrap: wrap;
    align-content: flex-start;
    justify-content: space-between;
}

.v-card-mini {
    margin: 40px 0px;
}
</style>