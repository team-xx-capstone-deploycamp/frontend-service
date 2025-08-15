<template>
  <div class="max-w-4xl mx-auto p-6 bg-white rounded shadow">
    <h2 class="text-xl font-semibold mb-4">Prediksi Harga Mobil</h2>

    <!-- Info Dasar -->
    <fieldset class="border border-gray-300 p-4 rounded mb-4">
      <legend class="text-md font-medium">Info Dasar</legend>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-2">
        <div>
          <label class="block font-medium">Car Name <span class="text-blue-500 cursor-help" title="Merek mobil">&#9432;</span></label>
          <input v-model="form.CarName" type="text" class="w-full border rounded px-3 py-2" placeholder="Mazda GLC" required />
        </div>
        <div>
          <label class="block font-medium">Fuel Type <span class="text-blue-500 cursor-help" title="Bensin atau diesel">&#9432;</span></label>
          <select v-model="form.fueltype" class="w-full border rounded px-3 py-2" required>
            <option disabled value="">Pilih salah satu</option>
            <option value="gas">Gas</option>
            <option value="diesel">Diesel</option>
          </select>
        </div>
      </div>
    </fieldset>

    <!-- Spesifikasi Body dan Struktur -->
    <fieldset class="border border-gray-300 p-4 rounded mb-4">
      <legend class="text-md font-medium">Body & Struktur</legend>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mt-2">
        <div>
          <label class="block font-medium">Car Body <span class="text-blue-500 cursor-help" title="Jenis body mobil seperti sedan, hatchback, dll">&#9432;</span></label>
          <select v-model="form.carbody" class="w-full border rounded px-3 py-2" required >
            <option disabled value="">Pilih salah satu</option>
            <option value="sedan">Sedan</option>
            <option value="hatchback">Hatchback</option>
            <option value="wagon">Wagon</option>
            <option value="convertible">Convertible</option>
            <option value="hardtop">Hardtop</option>
          </select>
        </div>
        <div>
          <label class="block font-medium">Door Number<span class="text-blue-500 cursor-help" title="Jumlah pintu mobil">&#9432;</span></label>
          <select v-model="form.doornumber" class="w-full border rounded px-3 py-2">
            <option disabled value="">Pilih salah satu</option>
            <option value="two">Dua</option>
            <option value="four">Empat</option>
          </select>
        </div>
        <div>
          <label class="block font-medium">Drive Wheel <span class="text-blue-500 cursor-help" title="Tipe penggerak (fwd, rwd, 4wd)">&#9432;</span></label>
          <select v-model="form.drivewheel" class="w-full border rounded px-3 py-2" required>
            <option disabled value="">Pilih salah satu</option>
            <option value="fwd">FWD</option>
            <option value="rwd">RWD</option>
            <option value="4wd">4WD</option>
          </select>
        </div>
      </div>
    </fieldset>

    <!-- Mesin Utama -->
    <fieldset class="border border-gray-300 p-4 rounded mb-4">
      <legend class="text-md font-medium">Mesin Utama</legend>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mt-2">
        <div>
          <label class="block font-medium">Engine Size <span class="text-blue-500 cursor-help" title="Ukuran mesin (cc)">&#9432;</span></label>
          <input v-model.number="form.enginesize" type="number" class="w-full border rounded px-3 py-2" placeholder="61 - 326" required />
        </div>
        <div>
          <label class="block font-medium">Horsepower <span class="text-blue-500 cursor-help" title="Tenaga mesin dalam HP">&#9432;</span></label>
          <input v-model.number="form.horsepower" type="number" class="w-full border rounded px-3 py-2" placeholder="48 - 288" required />
        </div>
        <div>
          <label class="block font-medium">Cylinder Number<span class="text-blue-500 cursor-help" title="Jumlah total silinder mesin mobil ">&#9432;</span></label>
          <select v-model="form.cylindernumber" class="w-full border rounded px-3 py-2" required>
            <option disabled value="">Pilih salah satu</option>
            <option value="three">Three</option>
            <option value="four">Four</option>
            <option value="five">Five</option>
            <option value="six">Six</option>
            <option value="seven">Seven</option>
            <option value="eight">Eight</option>
            <option value="twelve">Twelve</option>
          </select>
        </div>
        <div>
          <label class="block font-medium">Engine Type<span class="text-blue-500 cursor-help" title="Tipe mesin mobil">&#9432;</span></label>
          <select v-model="form.enginetype" class="w-full border rounded px-3 py-2">
            <option disabled value="">Pilih salah satu</option>
            <option value="ohc">OHC</option>
            <option value="ohcv">OHCV</option>
            <option value="dohc">DOHC</option>
            <option value="dohcv">DOHCV</option>
            <option value="l">L</option>
          </select>
        </div>
        <div>
          <label class="block font-medium">Engine Location<span class="text-blue-500 cursor-help" title="Letak mesin utama mobil">&#9432;</span></label>
          <select v-model="form.enginelocation" class="w-full border rounded px-3 py-2">
            <option disabled value="">Pilih salah satu</option>
            <option value="front">Depan</option>
            <option value="rear">Belakang</option>
          </select>
        </div>
        <div>
          <label class="block font-medium">Peak RPM<span class="text-blue-500 cursor-help" title="Putaran maksimum">&#9432;</span></label>
          <input v-model.number="form.peakrpm" type="number" class="w-full border rounded px-3 py-2" placeholder="4150 - 6600" required />
        </div>
      </div>
    </fieldset>

    <!-- Detail Mesin -->
    <fieldset class="border border-gray-300 p-4 rounded mb-4">
      <legend class="text-md font-medium">Detail Mesin</legend>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-2">
        <div>
          <label class="block font-medium">Bore Ratio <span class="text-blue-500 cursor-help" title="Perbandingan diameter silinder dengan panjang stroke.">&#9432;</span></label>
          <input v-model.number="form.boreratio" type="number" class="w-full border rounded px-3 py-2" placeholder="2.54 - 3.94" />
        </div>
        <div>
          <label class="block font-medium">Stroke <span class="text-blue-500 cursor-help" title="Panjang langkah piston di dalam silinder.">&#9432;</span></label>
          <input v-model.number="form.stroke" type="number" class="w-full border rounded px-3 py-2" placeholder="2.07 - 4.17"/>
        </div>
        <div>
          <label class="block font-medium">Compression Ratio <span class="text-blue-500 cursor-help" title="Perbandingan volume silinder saat piston di bawah dan di atas.">&#9432;</span></label>
          <input v-model.number="form.compressionratio" type="number" class="w-full border rounded px-3 py-2" placeholder="7 - 23" />
        </div>
      </div>
    </fieldset>

    <!-- Spesifikasi Bahan Bakar -->
    <fieldset class="border border-gray-300 p-4 rounded mb-4">
      <legend class="text-md font-medium">Spesifikasi Bahan Bakar</legend>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mt-2">
        <div>
          <label class="block font-medium">Fuel System<span class="text-blue-500 cursor-help" title="Sistem injeksi bahan bakar">&#9432;</span></label>
          <select v-model="form.fuelsystem" class="w-full border rounded px-3 py-2">
            <option disabled value="">Pilih salah satu</option>
            <option value="mpfi">MPFI</option>
            <option value="mfi">MFI</option>
            <option value="2bbi">2BBI</option>
            <option value="idi">IDI</option>
            <option value="1bbl">1BBL</option>
          </select>
        </div>
        <div>
          <label class="block font-medium">Highway MPG <span class="text-blue-500 cursor-help" title="Efisiensi bahan bakar di jalan tol, diukur dalam mil per galon (MPG).">&#9432;</span></label>
          <input v-model.number="form.highwaympg" type="number" class="w-full border rounded px-3 py-2" placeholder="16 - 54"/>
        </div>
        <div>
          <label class="block font-medium">City MPG <span class="text-blue-500 cursor-help" title="Efisiensi BBM di kota">&#9432;</span></label>
          <input v-model.number="form.citympg" type="number" class="w-full border rounded px-3 py-2" placeholder="13 - 49"/>
        </div>
        <div>
          <label class="block font-medium">Aspiration<span class="text-blue-500 cursor-help" title="Sistem pemasukan udara mesin">&#9432;</span></label>
          <select v-model="form.aspiration" class="w-full border rounded px-3 py-2">
            <option disabled value="">Pilih salah satu</option>
            <option value="std">Standar</option>
            <option value="turbi">Turbo</option>
          </select>
        </div>
      </div>
    </fieldset>

    <!-- Spesifikasi Dimensi dan Bobot -->
    <fieldset class="border border-gray-300 p-4 rounded mb-4">
      <legend class="text-md font-medium">Dimensi dan Bobot</legend>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mt-2">
        <div>
          <label class="block font-medium">Curb Weight <span class="text-blue-500 cursor-help" title="Berat kosong mobil (kg)">&#9432;</span></label>
          <input v-model.number="form.curbweight" type="number" class="w-full border rounded px-3 py-2" placeholder="1488 - 4066" />
        </div>
      </div>
    </fieldset>

    <!-- Tombol Aksi -->
    <div class="flex justify-between mt-4">
      <button @click="submitForm" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded">Prediksi Harga</button>
      <button @click="resetForm" class="bg-gray-200 hover:bg-gray-300 px-4 py-2 rounded">Reset</button>
    </div>

    <!-- Hasil Prediksi -->
    <div v-if="predictedPrice !== null" class="mt-6 p-4 border rounded bg-green-50 text-green-800">
      <strong>Prediksi Harga:</strong> ${{ predictedPrice }}
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        CarName: '',
        fueltype: '',
        enginesize: null,
        horsepower: null,
        citympg: null,
        curbweight: null,
        drivewheel: '',
        carbody: '',
        doornumber: '',
        enginelocation: '',
        enginetype: '',
        cylindernumber: '',
        fuelsystem: '',
        boreratio: null,
        stroke: null,
        compressionratio: null,
        peakrpm: null,
        highwaympg: null,
        aspiration: '',
      },
      predictedPrice: null,
    };
  },
  methods: {
    async submitForm() {
      try {
        const base_url = process.env.VUE_APP_API_URL || 'http://127.0.0.1:8000';
        const response = await fetch(`${base_url}/v1/predict`, {
          method: 'POST',
          headers: { 
            'Content-Type': 'application/json',
            'Authorization': process.env.VUE_APP_API_KEY || 'Basic YWRtaW46Y2hhbmdlbWU='
          },
          body: JSON.stringify({record: this.form}),
        });
        const data = await response.json();
        this.predictedPrice = data.prediction[0];
      } catch (error) {
        console.error('Prediction failed:', error);
      }
    },
    resetForm() {
      this.form = {
        CarName: '',
        fueltype: '',
        enginesize: null,
        horsepower: null,
        citympg: null,
        curbweight: null,
        drivewheel: '',
        carbody: '',
        doornumber: '',
        enginelocation: '',
        enginetype: '',
        cylindernumber: '',
        fuelsystem: '',
        boreratio: null,
        stroke: null,
        compressionratio: null,
        peakrpm: null,
        highwaympg: null,
        aspiration: ''
      };
      this.predictedPrice = null;
    },
  },
};
</script>

<style scoped>
label span {
  font-size: 0.8rem;
}
</style>
