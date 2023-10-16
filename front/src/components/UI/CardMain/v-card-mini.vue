<template>
    <div class="v-card-mini">
        <div class="v-inner">
            <img class="v-mini-image" :src="image" alt="">
            <div class="v-mini-data">
                <h3>{{title}}</h3>
                <p>{{body}}</p>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        image: String,
        title: String,
        body: String,
    }
}
</script>

<style scoped>
.v-card-mini {
    width: 440px;
    margin: 20px 40px;
}

.v-mini-image {
    margin-right: 30px;
}
</style>