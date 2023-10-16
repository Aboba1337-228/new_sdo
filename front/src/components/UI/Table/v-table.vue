<template>
    <table class="table" v-if="data[0]">
        <thead>
            <tr>
                <th>Число вопросов</th>
                <th 
                    v-for="i in JSON.parse(data).length" 
                    :key="i">{{i}}</th> 
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Ответы</td>
                <td
                    v-for="i in JSON.parse(data).length" 
                    :key="i">{{ JSON.parse(data)[i - 1] }}</td>
            </tr>
        </tbody>
    </table>
</template>

<script>
export default {
    props: {
        data: Object
    }
}
</script>

<style scoped>
.table {
	width: 100%;
	border: none;
	margin-bottom: 20px;
}

.table thead th {
	padding: 10px;
	font-weight: 500;
	font-size: 16px;
	line-height: 20px;
	text-align: left;
	color: #444441;
	border-top: 2px solid #716561;
	border-bottom: 2px solid #716561;
}

.table tbody td {
	padding: 10px;
	font-size: 14px;
	line-height: 20px;
	color: #444441;
}
</style>